<template>
    <ProgressBar :pageNo="PageNo"/>
    <div v-show="PageNo === 'page_1'">
        <v-form  class="form-div" @submit.prevent="goConfirmPage">
            <v-row class="row-text">
                <v-col class="label-col" cols="8" md="2">
                    <v-icon class="red-dot" icon="mdi-circle-medium" size="40"></v-icon>
                    <v-label for="name">お名前（漢字）</v-label>
                </v-col>
                <v-col class="text-col" cols="8" md="6">
                    <v-text-field placeholder="山田 太郎" variant="outlined" id="name" v-model="name_1" :rules="[rules.required, rules.name]"></v-text-field>
                </v-col>
            </v-row>
            <v-row class="row-text">
                <v-col class="label-col" cols="8" md="2">
                    <v-icon class="blank-dot" icon="mdi-circle-medium" size="40"></v-icon>
                    <v-label for="name_2">お名前（かな）</v-label>
                </v-col>
                <v-col class="text-col" cols="8" md="6">
                    <v-text-field placeholder="やまだ たろう" variant="outlined" id="name_2" v-model="name_2"></v-text-field>
                </v-col>
            </v-row>
            <v-row class="row-text">
                <v-col class="label-col" cols="8" md="2">
                    <v-icon class="red-dot" icon="mdi-circle-medium" size="40"></v-icon>
                    <v-label for="phone">電話番号</v-label>
                </v-col>
                <v-col class="text-col" cols="8" md="6">
                    <v-text-field placeholder="03-1234-5678" variant="outlined" id="phone" v-model="phone" :rules="[rules.required, rules.phone]"></v-text-field>
                </v-col>
            </v-row>
            <v-row class="row-text">
                <v-col class="label-col" cols="8" md="2">
                    <!-- <v-icon class="red-dot" icon="mdi-circle-medium" size="40"></v-icon> -->
                    <v-icon class="red-dot" icon="mdi-circle-medium" size="40"></v-icon>
                    <v-label for="email">メールアドレス</v-label>
                </v-col>
                <v-col class="text-col" cols="8" md="6">
                    <v-text-field placeholder="name@abcdefg.com" variant="outlined" id="email" :rules="[rules.required, rules.email]" v-model="email"></v-text-field>
                </v-col>
            </v-row>
            <v-row class="row-menu">
                <v-col class="label-col" cols="8" md="2">
                    <!-- <v-icon class="red-dot" icon="mdi-circle-medium" size="40"></v-icon> -->
                    <v-icon class="red-dot" icon="mdi-circle-medium" size="40"></v-icon>
                    <v-label for="">ご希望のコース</v-label>
                </v-col>
                <v-col class="text-col" cols="8" md="6">
                    <interestMenu @gate_SelectedInterests="updateSelectedInterests"/>    
                </v-col>
            </v-row>
            <v-row class="row-menu">
                <v-col class="label-col" cols="8" md="2">
                    <v-icon class="red-dot" icon="mdi-circle-medium" size="40"></v-icon>
                    <v-label for="" style="word-wrap: break-word;">ご希望のスタジオ</v-label>
                </v-col>
                <v-col cols="8" md="6">
                    <Location @gate_SelectedCities="updateSelectedCities" />
                </v-col>
            </v-row>
            <v-row class="row-menu">
                <v-col class="label-col" cols="8" md="2">
                    <v-icon class="red-dot" icon="mdi-circle-medium" size="40"></v-icon>
                    <v-label for="" style="word-wrap: break-word;">ご希望の日時</v-label>
                </v-col>
                <v-col cols="8" md="6">
                    <Time @gate_SelectedDays="updateSelectedDays" @gate_SelectedTimes="updateSelectedTimes"/>
                </v-col>
            </v-row>
            <v-row class="row-menu">
                <v-col  class="label-col" cols="6" md="6">
                    <ScrollBox />
                </v-col>
            </v-row>
            <v-row class="row-menu">
                <v-col cols="5" md="5">
                    <v-btn block type="submit" class="submit-btn">プライバシーポリシーに同意して確認 > </v-btn>
                </v-col>
            </v-row>
        </v-form>
    </div>
    <!--  -->
    <div v-show="PageNo === 'page_2'">
        <v-container>
            <div class="form-div">
                <v-row class="row-text">
                    <v-col cols="6" md="2"><span>お名前（漢字）</span></v-col>
                    <v-col cols="6" md="4">{{ name_1 }}</v-col>
                </v-row>
                <v-row class="row-text">
                    <v-col cols="6" md="2"><span>お名前（かな</span></v-col>
                    <v-col cols="6" md="4">{{ name_2 }}</v-col>
                </v-row>
                <v-row class="row-text">
                    <v-col cols="6" md="2"><span>電話番号</span></v-col>
                    <v-col cols="6" md="4">{{ phone }}</v-col>
                </v-row>
                <v-row class="row-text">
                    <v-col cols="6" md="2"><span>メールアドレス</span></v-col>
                    <v-col cols="6" md="4">{{ email }}</v-col>
                </v-row>
                <v-row class="row-text">
                    <v-col cols="6" md="2"><span>ご希望のコース</span></v-col>
                    <v-col cols="6" md="4">{{ selectedInterests }}</v-col>
                </v-row>
                <v-row class="row-text">
                    <v-col cols="6" md="2"><span>ご希望のスタジオ</span></v-col>
                    <v-col cols="6" md="4">{{ selectedCites }}</v-col>
                </v-row>
                <v-row class="row-text">
                    <v-col cols="6" md="2"><span>ご希望の日時</span></v-col>
                    <v-col cols="6" md="4">{{ selectedDays }}</v-col>
                </v-row>
                <v-row class="row-text">
                    <v-col cols="6" md="2"><span>ご希望の時間帯</span></v-col>
                    <v-col cols="6" md="4">{{ selectedTimes }}</v-col>
                </v-row>
                <v-row>
                    <v-col cols="2" md="2"></v-col>
                    <v-col cols="10" md="6">
                        <v-btn @click="backToForm" block class="back-btn"> 修 正</v-btn>
                    </v-col>
                </v-row>
                <v-row>
                    <v-col cols="2" md="2"></v-col>
                    <v-col cols="10" md="6">
                        <v-btn type="submit" @click="submitConfirm"  block class="submit-btn">この内容で送信</v-btn>
                    </v-col>
                    
                </v-row>
        </div>
        </v-container>
    </div>
    <div v-show="PageNo === 'page_3'">
        <v-container>
            <div class="form-div">
                
                <v-row class="row-text">
                    <v-col cols="4" md="4"><h2>送信完了</h2></v-col>
                </v-row>
                
                <v-row class="row-text">
                    <v-col cols="6" md="2"><span>お名前（漢字）</span></v-col>
                    <v-col cols="6" md="4">{{ name_1 }}</v-col>
                </v-row>
                <v-row class="row-text">
                    <v-col cols="6" md="2"><span>お名前（かな</span></v-col>
                    <v-col cols="6" md="4">{{ name_2 }}</v-col>
                </v-row>
                <v-row class="row-text">
                    <v-col cols="6" md="2"><span>電話番号</span></v-col>
                    <v-col cols="6" md="4">{{ phone }}</v-col>
                </v-row>
                <v-row class="row-text">
                    <v-col cols="6" md="2"><span>メールアドレス</span></v-col>
                    <v-col cols="6" md="4">{{ email }}</v-col>
                </v-row>
                
            </div>
        </v-container>
    </div>
    <!-- <h1>{{ selectedInterests }}</h1> -->
</template>

<script scoped>
    import ProgressBar from '../components/ProgressBar.vue'
    import interestMenu from '@/components/interestMenu.vue'
    import Location from '@/components/Location.vue'
    import Time from '@/components/Time.vue'
    import ScrollBox from '@/components/ScrollBox.vue'
    export default {
        data() {
            return {
                formCompleted: false,
                validFormInput: true,
                // submitConfrim: false,
                PageNo: 'page_1',
                name_1: ".",
                name_2: ".",
                phone: ".",
                email: ".",
                selectedDays: [],
                selectedTimes: [],
                selectedCites: [],
                selectedInterests: '.',

                rules: {
                    required: value => !!value || '必須。',
                    counter: value => value.length <= 20 || 'Max 20 characters',
                    name: value => {
                        const pattern = /^([ぁ-んァ-ン一-龠\s]+)$/
                        return pattern.test(value) || '※「お名前（漢字）」は入力必須です。'
                    },
                    phone: value => {
                        const pattern = /^([0-9]{2}-[0-9]{4}-[0-9]{4})$/
                        return pattern.test(value) || '※「電話番号」を正しく入力してください。'
                    },
                    email: value => {
                        const pattern = /^(([^<>()[\]\\.,;:\s@"]+(\.[^<>()[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/
                        return pattern.test(value) || '※「メールアドレス」を正しく入力してください。'
                    },
                },
            };
        },
        methods: {
            updateSelectedDays(value) {
                this.selectedDays = value
            },
            updateSelectedTimes(value) {
                this.selectedTimes = value
            },
            updateSelectedCities(value) {
                this.selectedCites = value
            },
            updateSelectedInterests(value) {
                this.selectedInterests = value
            },
            async sendEmail() {
                try {
                    const response = await fetch('https://rubybackend.onrender.com/send_email', {
                        method: 'POST',
                        headers: {
                        'Content-Type': 'application/json'
                        },
                        body: JSON.stringify({ 
                            name_1: this.name_1,
                            name_2: this.name_2,
                            phone: this.phone,
                            email: this.email,
                            selectedDays: this.selectedDays,
                            selectedTimes: this.selectedTimes,
                            selectedCites: this.selectedCites,
                            selectedInterests: this.selectedInterests
                         })
                    })
                    
                    } catch (error) {
                        console.error(error)
                }
            },
            goConfirmPage(event) {
                if(this.ableToSubmit()){
                    // this.formCompleted = true
                    this.PageNo = 'page_2'
                }
                // this.PageNo = 'page_2'
            },
            backToForm() {
                // this.formCompleted = false
                this.PageNo = 'page_1'
            },
            ableToSubmit() {
                // Check if all required fields are filled out
                // const test = !(this.name_1.length * this.phone.length * this.email.length * this.selectedDays.length * 
                // this.selectedTimes.length * this.selectedCites.length * this.selectedInterests.length) == 0

                return (this.rules.name(this.name_1) == true && (this.rules.name(this.name_2)  == true || this.name_2.length == 0)  && 
                this.rules.phone(this.phone) == true  && this.rules.email(this.email) == true)

            },
            submitConfirm() {
                this.sendEmail()
                this.PageNo = 'page_3'
            },

            
            
        },
        computed :{
            
        }
    };
</script>

<style lang="scss" scoped>
.form-div {
    // transform: translate(10%, 0%);
    // display: flex;
    // justify-content: ce;
    width: 100vw;
}
.row-text {
    display: flex;
    justify-content: center;
    // align-items: flex-start;
    // margin-top: -10px;
    // width: 70vw;
}
.label {
    font-size: medium;
}
.red-dot {
    color: rgb(221, 3, 3);
}
.blank-dot {
    color: transparent;
}
.label-col {
    display: flex;
    // justify-content:start;
}
.text-col {
    display: flex;
    // align-items:flex-end;
}
.row-menu {
    display: flex;
    justify-content: center;
    align-items: flex-start;
    margin-top: 10px;
}
.submit-btn {
    margin-top: 16px;
    border-radius: 20px;
    height: 45px;
    background-color: #FF9700;
    color: white;
    font-size: larger;
    font-weight: bolder;
}
.back-btn {
    margin-top: 50px;
    border-radius: 20px;
    height: 45px;
    background-color: #898988;
    color: white;
    font-size: larger;
    font-weight: bolder;
}

</style>
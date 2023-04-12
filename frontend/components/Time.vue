<template>
    <div>
        日付:
        <v-row class="menubar">
            <v-col class="col" v-for="(day, index) in dayList">
                <div class="menubar-selection-div">
                    <v-checkbox 
                    class="menubar-selection-checkbox"
                    v-model="selectedDays" 
                    :label="day"
                    :value="day"
                    :rules="dayRule"
                    @change="passSelectedDays"
                    ></v-checkbox>
                    <!-- <v-messages :value="dayRule" color="red" v-for="(error, index) in dayRule">
                            <v-message :key="index">{{ error }}</v-message>
                    </v-messages> -->
                </div>
            </v-col>    
        </v-row>
    </div>
    <div>
        <v-row class="menubar">
            <v-col class="col" v-for="(time, index) in timeList">
                <div class="menubar-selection-div">
                    <v-checkbox 
                    class="menubar-selection-checkbox"
                    v-model="selectedTimes" 
                    :label="time"
                    :value="time"
                    :rules="timeRule"
                    @change="passSelectedTimes"
                    ></v-checkbox>
                    <!-- :hide-details="index != timeList.length-1" -->
                </div>
            </v-col>    
        </v-row>
        
    </div>
</template>

<script>
    export default {
        // props: {
        //     selectedDays_par: selectedDays,
        //     selectedTimes_par: selectedTimes,
        // },
        data() {
            return {
                dayList: ['平日', '祝休日'],
                timeList: ['10時〜14時','14時〜18時','18時〜21時'],
                selectedDays: [],
                selectedTimes: [],
                
            }
        },
        methods: {
            // handleDaySelect_left() {
            //     this.daySelected_left = true
            // },
            passSelectedDays() {
                this.$emit('gate_SelectedDays', this.selectedDays)
            },
            passSelectedTimes() {
                this.$emit('gate_SelectedTimes', this.selectedTimes)
            }
        },
        computed: {
            dayRule() {
                return [this.selectedDays.length > 0 || '※「ご希望の日時」は入力必須です。']
            },
            timeRule() {
                return [this.selectedTimes.length > 0 || '※「ご希望の時間帯」は入力必須です。']
            },
            // dayRuleErrors() {
            //     return !this.selectedDays.length ? ['Please select at least one checkbox'] : [];
            // },
            // timeRuleErrors() {
            //     return !this.selectedCheckboxes.length ? ['Please select at least one checkbox'] : [];
            // },
        }
    }
</script>

<style lang="scss" scoped>
.bar-div {
    border: 1px solid #c2c1c1;
    background-color: #F2F2F2;
    border-radius: 10px;
    overflow: hidden;
    height: 60px;
    display: flex;
    align-items:first baseline;
    justify-content: center;
    cursor: pointer;
    
}
.menubar {
    margin-top: 20px;
    // border: 1px solid #c2c1c1;
    // background-color: #F2F2F2;
    // border-radius: 10px;
    overflow: hidden;
    height: 100px;
    // width: 100px;
    cursor: pointer;
    label {
        cursor: pointer;
    }
}
.col {
    border-radius: 10px;
    border: 1px solid #c2c1c1;
    background-color: #F2F2F2;
    height: 50px;
}
.col.clicked {
    background-color: #FF9700;
    transition: background-color 0.3s ease;
    color: white;
}
.menubar-selection-checkbox {
    display: flex;
    flex-direction: column;
    // align-items: center;
    transform: translate(0%, 15%);
    // position: absolute;
    font-weight: 600;
    color: black;
}

.menubar-selection-div {
    display: flex;
    align-items: center;
    height: 20px;
    // font-weight: 600;
}

</style>
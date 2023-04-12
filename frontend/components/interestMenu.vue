<template>
    <v-container class="container">
        <v-row class="menubar">
            <v-col class="menubar-selection" :class="{clicked: isClicked_left}" @click="handleClick_left">
                <div class="menubar-selection-div">
                    <div>
                        <v-icon icon="mdi-format-list-bulleted" class="mr-2"></v-icon>
                        <label>コース一覧 から選ぶ</label>
                    </div>
                    <span class="diamond" :class="{clicked: isClicked_left}"></span>
                </div>
            </v-col>
            <v-col class="menubar-selection" :class="{clicked: !isClicked_left}" @click="handleClick_right">
                <div class="menubar-selection-div" >
                    <div>
                        <v-icon icon="mdi-magnify" class="mr-2"></v-icon>
                        <label>キーワードで 検索</label>
                    </div>
                    <span class="diamond" :class="{clicked: !isClicked_left}"></span>
                </div>
            </v-col>
        </v-row>
        <v-row>
            <v-col class="selection-list">
                <div v-show="isClicked_left">
                    <!-- <InstrumentList v-show="isClicked_left" /> -->
                    <v-select class="select" 
                    label="打楽器コース(3)" 
                    variant="solo" 
                    v-model="selectedDrum"
                    :items="drum" 
                    :rules="rule"
                    @change="passSelectedInterests"></v-select>
                    <v-select class="select" 
                    label="弦楽器コース(5)" 
                    variant="solo" 
                    v-model="selectedStringed" 
                    :items="stringed" 
                    :rules="rule" ></v-select>
                    <h1>{{ selection }}</h1>
                </div>
            </v-col>
    </v-row>
    </v-container>
</template>
  
<script>
    import InstrumentList from '~/components/InstrumentList.vue'
    export default {

        data() {
         return {
            isClicked_left: true,
            drum: ['ドラム','パーカッション','パンディエロ'],
            stringed: ['ヴァイオリン','ヴィオラ','チェロ','コントラバス','ハープ'],
            selectedDrum: '',
            selectedStringed: '',
            selection: '',
            
         }
        },
        watch: {
            selectedDrum(newValue, oldValue) {
                if(newValue != oldValue && newValue != ''){
                    this.selection = newValue
                    this.selectedStringed = ''
                    
                }
            },
            selectedStringed(newValue, oldValue) {
                if(newValue != oldValue && newValue != ''){
                    this.selection = newValue
                    this.selectedDrum = ''
                    
                }
            }
        },
        methods: {
            handleClick_left() {
                this.isClicked_left = true
            },
            handleClick_right() {
                this.isClicked_left = false
            },
            passSelectedInterests() {
                this.$emit('gate_SelectedInterests', this.selection)
            }
        },
        computed: {
            rule() {
                return [this.selection.length > 0 || '※「ご希望のコース」は入力必須です。']
            }
        }
    }
</script> 
<style lang="scss" scoped>
.container {
    width: 100%;
    
}
.interestMenu-div {
    display: flex;
    flex-direction: column;
    width: 100%;
    justify-content: center;
    align-items: center;
    
}
.label {
  color: rgb(121, 121, 121);
}
.menubar {
    border: 1px solid #c2c1c1;
    background-color: #F2F2F2;
    border-radius: 10px;
    overflow: hidden;
    height: 50px;
    cursor: pointer;
    label {
        cursor: pointer;
    }
}
.menubar-selection {
    display: flex;
    justify-content: center;
}
.menubar-selection-div {
    display: flex;
    flex-direction: column;
    position: absolute;
    justify-content: center;
    // color: white;
    font-weight: 600;
}
.menubar-selection.clicked {
  background-color: #FF9700;
  transition: background-color 0.3s ease;
  color: white;
}
// .diamond {
//     position: relative;
//     display: flex;
//     width: 10px;
//     height: 10px;
//     transform: translate(10%, 60%) rotate(45deg);
//     // left: 70%;
    
//     // border: 1px solid rgb(0, 0, 0);
//     background-color: transparent;
// }
.diamond {
    position: relative;
    display: flex;
    width: 10px;
    height: 10px;
    transform: translate(0%, 60%) rotate(45deg);
    left: 50%;
}
.diamond.clicked {  
    // border: 1px solid rgb(0, 0, 0);
    background-color: #FF9700;
    transition: background-color 1.5s ease;
}
.selection-list {
    display: flex;
    flex-direction: column;
}

</style>
<template>
    <div class="progressBar-div">
        <v-chip  class="custom-chip" variant="elevated">入力</v-chip>
        <span class="custom-span"> > </span>
        <v-chip  class="custom-chip"  variant="elevated">確認</v-chip>
        <span class="custom-span"> > </span>
        <v-chip  class="custom-chip"  variant="elevated">完了</v-chip>
        <span class="custom-span"> > </span>
        <v-chip  class="custom-chip custom-chip-2" variant="elevated">体験予約即決</v-chip>
    </div>
</template>

<script>
    import { VChip, VIcon } from '../node_modules/vuetify/lib/components';
    export default {
        name: 'ProgressBar',
        // extends: VChip,
        // data() {
        //     return {
        //         color_on: 'black',
        //         color_off: 'grey',
        //         chipcolor_1: this.color_off,
        //         chipcolor_2: this.color_off,
        //         chipcolor_3: this.color_off,
        //     }
        // },
        // props: {
        //     pageNo: Number
        // },
        // watch: {
        //     pageNo(newValue, oldValue){
        //         if(newValue == 1){
        //             this.chipcolor_1 = this.color_off
        //             this.chipcolor_2 = this.color_off
        //             this.chipcolor_3 = this.color_off
        //         }
        //     }
        // }
    }
</script>

<style lang="scss" scoped>
.progressBar-div{
    display: flex;
    justify-content: center;
    align-items: center;
    margin-bottom: 80px;
    height: 100px;
}
.custom-chip {
    width: 65px;
    height: 65px;
    border-radius: 50%;
    background-color: rgb(193, 192, 192);
    justify-content: center;
    font-size: medium;
    // font-weight: 600;
    color: white;
    white-space: normal;
}
.custom-chip.custom-chip-2 {
    font-size: small;
    background-color: orange;
}
.custom-span {
    font-weight: 600;
    margin: 40px;
}
</style>
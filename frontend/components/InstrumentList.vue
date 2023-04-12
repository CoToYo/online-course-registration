<!-- <template>
    <div class="text-center">
      <v-menu
        open-on-hover
      >
        <template v-slot:activator="{ props }">
          <v-btn
            color="primary"
            v-bind="props"
          >
            Dropdown
          </v-btn>
        </template>
  
        <v-list>
          <v-list-item
            v-for="(item, index) in items"
            :key="index"
          >
            <v-list-item-title>{{ item.title }}</v-list-item-title>
          </v-list-item>
        </v-list>
      </v-menu>
    </div>
</template> -->

<template>
  <v-select class="select" :items="drum" label="打楽器コース（3）" variant="solo" v-model="selectedDrum" :rules="rule">
  </v-select>
  <v-select class="select" :items="stringed" label="弦楽器コース（5）" variant="solo" v-model="selectedStringed" :rules="rule">
  </v-select>
  <h1>{{ selection }}</h1>
</template>

<script>
  export default {
    data: () => ({
      drum: ['ドラム','パーカッション','パンディエロ'],
      stringed: ['ヴァイオリン','ヴィオラ','チェロ','コントラバス','ハープ'],
      selectedDrum: '',
      selectedStringed: '',
      selection: '',
    }),

    watch: {
        selectedDrum(newValue, oldValue) {
          if(newValue != oldValue){
            this.selection = newValue
            this.selectedStringed = ''
          }
        },
        selectedStringed(newValue, oldValue) {
          if(newValue != oldValue){
            this.selection = newValue
            this.selectedDrum = ''
          }
        }
      },

    methods: {
      // handleSelectChange() {
      //   this.selection = this.selectedItem;
      // } 
    },
    computed: {
        rule() {
            return [this.selection.length > 0 || '※「ご希望のコース」は入力必須です。']
        }
    }
  }
</script>

<style lang="scss" scoped>
.select {
  width: 100%;
}
</style>
<template>
    <div class="bar-div">
        <v-checkbox v-model="isOnline" label="オンラインスタジオ" @change="passSelectedCities"></v-checkbox>
    </div>
    <div v-show="!isOnline">
        <v-row class="menubar">
            <v-col class="menubar-selection" :class="{clicked: isClicked_left}" @click="handleClick_left">
                <div class="menubar-selection-div">
                    <div>
                        <v-icon icon="mdi-map-marker" class="mr-2"></v-icon>
                        <label>現在地 から選ぶ</label>
                    </div>
                    <span class="diamond" :class="{clicked: isClicked_left}"></span>
                </div>
            </v-col>
            <v-col class="menubar-selection" :class="{clicked: isClicked_mid}" @click="handleClick_mid">
                <div class="menubar-selection-div" >
                    <div>
                        <v-icon icon="mdi-map" class="mr-2"></v-icon>
                        <label>エリア から選ぶ</label>
                    </div>
                    <span class="diamond" :class="{clicked: isClicked_mid}"></span>
                </div>
            </v-col>
            <v-col class="menubar-selection" :class="{clicked: isClicked_right}" @click="handleClick_right">
                <div class="menubar-selection-div" >
                    <div>
                        <v-icon icon="mdi-magnify" class="mr-2"></v-icon>
                        <label>キーワードで 検索</label>
                    </div>
                    <span class="diamond" :class="{clicked: isClicked_right}"></span>
                </div>
            </v-col>
        </v-row>
        <v-row>
            <v-col>
                <div v-show="isClicked_left">
                    <v-container>
                        <v-row>
                            <v-col v-for="city in citiesNearby" cols="4">
                                <v-sheet border :height="80" :width="225" >
                                    <v-checkbox 
                                    :label="city"
                                    :value="city"
                                    v-model="citiesSelected"
                                    @change="passSelectedCities"
                                    :disabled="citiesSelected.length > 4 && citiesSelected.indexOf(city) === -1">
                                    </v-checkbox>
                                </v-sheet>
                            </v-col>
                        </v-row>
                    </v-container>
                </div>
            </v-col>
        </v-row>
    </div>
</template>

<script>
    export default {
        data() {
            return {
                isOnline: false,
                isClicked_left: true,
                isClicked_mid: false,
                isClicked_right: false,
                location: '',
                citiesNearby: [],
                citiesSelected: [],
            }
        },
        mounted() {
            this.getLocation()
        },
        watch: {
            isClicked_left(newValue, oldValue){
                if(newValue == true){
                    this.getLocation()
                }
            },
            isOnline(newValue, oldValue){
                if (newValue != oldValue){
                    if(newValue == true){
                        this.citiesSelected = ['オンラインスタジオ']
                    }
                    else{
                        this.citiesSelected = []
                    }
                }
            }
        },
        methods: {
            handleClick_left() {
                this.isClicked_left = true
                this.isClicked_mid = false
                this.isClicked_right = false
            },
            handleClick_mid() {
                this.isClicked_mid = true
                this.isClicked_left = false
                this.isClicked_right = false
            },
            handleClick_right() {
                this.isClicked_right = true
                this.isClicked_mid = false
                this.isClicked_left = false
            },
            getLocation() {
                navigator.geolocation.getCurrentPosition(async(pos) => {
                    console.log(pos.coords.latitude)
                    // this.location = pos.coords.latitude
                    const geoApiUrl = `https://api.bigdatacloud.net/data/reverse-geocode-client?
                    latitude=${pos.coords.latitude}&longitude=${pos.coords.longitude}&localityLanguage=en`

                    try{
                        const geoInfo_json = await fetch(geoApiUrl)
                        const geoInfo = await geoInfo_json.json()
                        this.location  = geoInfo.city

                        this.citiesNearby = [this.location,'札幌','新潟','千葉','秋葉原','錦糸町','池袋']

                    } catch (error){
                        console.log(error)
                    }
                });

            },
            passSelectedCities() {
                this.$emit('gate_SelectedCities', this.citiesSelected)
            }
        },
        computed: {

        }

    }
</script>

<style lang="scss" scoped>
// .container {
//     width: 100%;
//     display: flex;
//     align-items: center;
// }
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
.menubar-selection-div {
    display: flex;
    flex-direction: column;
    position: absolute;
    justify-content: center;
    // color: white;
    font-weight: 600;
}
.diamond.clicked {
    position: relative;
    display: flex;
    width: 10px;
    height: 10px;
    transform: translate(0%, 60%) rotate(45deg);
    left: 45%;
    
    // border: 1px solid rgb(0, 0, 0);
    background-color: #FF9700;
    transition: background-color 1.5s ease;
}
.menubar-selection {
    display: flex;
    justify-content: center;
}
.menubar-selection.clicked {
  background-color: #FF9700;
  transition: background-color 0.3s ease;
  color: white;
}
</style>
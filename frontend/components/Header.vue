<template>
    <header>
        <div class="topicPath">
            <ul>
                <li><span>EYS音楽教室</span></li>
                <li> > </li>
                <li><span>無料体験レッスンのお申し込み</span></li>
            </ul>
        </div>
        <div class="topImageContainer">
            <div class="headerImg_1_div">
                <img src="@/assets/img/header_img_1.png" height="215px" width="1000px">
            </div>
            
        </div>
        <div class="pageTitleContainer">
            <div class="bubbleImg_1_div">
                <img src="@/assets/img/buble.png" height="100%" width="50%">
            </div>
            <div class="pageTitleContent">
                <div class="pageTitleContent-top">
                    <div class="pageTitle-left">
                        <h2>無料体験レッスンのお申し込み</h2>
                    </div>
                    <div class="pageTitle-right">
                        <img src="@/assets/img/header_img_2.png" height="100%" width="100%">
                    </div>
                </div>
                <div class="pageTitleContent-bottom">
                    <img src="@/assets/img/header_img_3.png" height="100%" width="1000px">
                </div>
            </div>
        </div>
    </header>
</template>

<script scoped>
    export default{
        name: "Header",
    }
</script>

<style lang="scss" scoped>
.topicPath {
    background-color: rgb(141, 140, 140);
    height: 50px;
    width: 100vw;
    display: flex;
    align-items: center;
    justify-content: center;
    p {
        color: white;
        font-size: small;
    }
    ul {
        width: 1000px;
        justify-content: center;
        align-items: center;
    }
    li {
        color: white;
        font-size: small;
        list-style-type: none;
        display: inline-block;
        margin: 5px;
    } 
}
.topImageContainer {
    margin-top: 5px;
    width: 100%;
}
.headerImg_1_div {
    display: flex;
    align-items: center;
    justify-content: center;
}

.pageTitleContainer {
    display: flex;
    flex-direction: column;
    background-color: white;
    align-items: center;
}
.bubbleImg_1_div{
    display: flex;
    align-items: center;
    justify-content: center;
    transform: translate(0%, -40%);
}
.pageTitleContent {
    position: relative;
    display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: center;
    transform: translate(0%, -20%);
}
.pageTitleContent-top {
    display: flex;
    flex-direction: row;
    width: 100%;
    justify-content: center;
    align-items: center;
}
.pageTitle-left {
    // position: relative;
    margin-right: 8%;
}
.pageTitle-right {
    margin-left: 8%;
}
.pageTitleContent-bottom {
    display: flex;
    justify-content: center;
    // align-items: center;
}

</style>
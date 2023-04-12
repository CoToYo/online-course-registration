<template>
    <v-app class="mainPage">
        <Header />
        <!-- <ProgressBar /> -->
        <Form />
    </v-app>

</template>

<script>
    import  Header from './components/Header.vue'
    import Form from './components/Form.vue'
    import ProgressBar from './components/ProgressBar.vue'

    export default {
        name: 'index',

        data() {
            return {
                email: ''
            }
        },
        
        components: {
            Header,
            Form,
            
        },

        methods: {
            async sendEmail() {
            try {
                const response = await fetch('http://localhost:3000/send_email', {
                    method: 'POST',
                    headers: {
                    'Content-Type': 'application/json'
                    },
                    body: JSON.stringify({ email: email.value })
                })
                
                } catch (error) {
                    console.error(error)
                }
            }
        }
        
        
    }
    
</script>

<style lang="scss" scoped>
.mainPage {
    display: flex;
    flex-direction: column;
    justify-content: center;
    align-items: center;
    height: 110vw;
}

</style>
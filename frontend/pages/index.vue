<template>
    <Header />
    <div>
        <form @submit.prevent="sendEmail">
            <label for="email">Email</label>
            <input type="email" v-model="email" id="email" required>
            <button type="submit">Send</button>
        </form>
    </div>
</template>

<script>
    import Header from '../components/Header'
    export default {
        data() {
            return {
                email: ''
            }
        },

        name: 'index',
        
        components: {
            Header
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

</style>
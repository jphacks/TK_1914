<template lang="pug">
    div.Profile
        div.Profile_InfoContainer
            div.Profile_UserIcon
                el-avatar(v-if="userInfo == null" src="/icon/man.svg" :size="130")
                img(v-else :src="userInfo.img" width="130px" hegiht="130")
            div.Profile_UserName {{userInfo.name}}
            div.Profile_MediaList
                a(v-for="link in userInfo.links" :href="link.url" target="_blank" class="Profile_MediaItem")
                    img(:src="`/icon/media/${link.media_platform.name}_black.svg`" width="40px" hegiht="40px")
            div.Profile_Comment
                span {{userInfo.comment}}
</template>

<script>

export default {
    name:'Profile',
    async asyncData ({ app, params }) {
        // const userId = params.id
        // const url = 'https://becky-server.herokuapp.com/api/v1/users/' + String(userId)
        // const data = await app.$axios.$get(url)
        // return { userInfo: data }
    },
    data() {
        return {
            userInfo: {
                img: '',
                name: '',
                links: [],
                comments: []
            }
        }
    },
    async mounted() {
        const userId = this.$nuxt.$route.params.id
        const url = 'https://becky-server.herokuapp.com/api/v1/users/' + String(userId)
        await this.$axios.$get(url)
        .then(res => {
            this.userInfo = res
        })

    },
}
</script>


<style lang="scss" scooped>
    .Profile {
        width: 100%;
        height: 100vh;
        padding: 25px;
        background-image: url('/icon/card_bg.svg');
        background-repeat: no-repeat;
        background-size: cover;
        background-position: center;
        display: flex;
        &_InfoContainer {
            background: #f3f3f1cc;
            width: 100%;
            max-width: 500px;
            margin: 0 auto;
            border-radius: 5px;
            display: flex;
            flex-flow: column;
            align-items: center;
            padding-top: 50px;
        }
        &_UserIcon {
            margin-bottom: 40px;
            border-radius: 50%;
            overflow: hidden;
        }
        &_UserName {
            @include font-size(30);
            border-bottom: solid 1.5px $black;
            padding: 0 10px 5px;
            font-weight: 600;
            margin-bottom: 40px;
        }
        &_MediaList {
            display: flex;
            margin-bottom: 50px;
        }
        &_MediaItem {
            &:nth-last-of-type(n+2) {
                margin-right: 20px;
            }
        }
        &_Comment {
            @include font-size(20);
        }
    }
</style>
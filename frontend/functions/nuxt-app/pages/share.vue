<template lang="pug">
    div.Share
        div.Share_ActionContainer
            div.Share_CopyLinkContainer
                div.Share_Link
                    a(:href="`https://becky-484f7.firebaseapp.com/profile/${userInfo.id}`" target="_blank") {{`https://becky-484f7.firebaseapp.com/profile/${userInfo.id}`}}
                div(@click="copyLink(`https://becky-484f7.firebaseapp.com/profile/${userInfo.id}`)" class="Share_CopyText") プロフィールのリンクをコピーする
            div(@click="showQRcodeModal" class="Share_QRcodeText")
                span QRコードを表示 ＞
        transition(name="fade")
            div(v-show="isActiveQRcode" class="Share_Modal" )
                img(:src="userInfo.qr" class="Share_QRcode")
                div(@click="closeQRcodeModal" class="Share_ModalLayer")
</template>

<script>
import { mapGetters } from 'vuex'


export default {
    name: 'Share',
    async asyncData ({ app, params, store }) {
        // const userId = store.state.user.userId
        const userId = 4
        const url = 'https://becky-server.herokuapp.com/api/v1/users/' + String(userId)
        const data = await app.$axios.$get(url)
        return { userInfo: data }
    },
    data() {
        return {
            isActiveQRcode: false
        }
    },
    methods: {
        copyLink(link) {
            this.$copyText(link)
            this.$message('あなたのプロフィールURLがコピーされました！')
        },
        showQRcodeModal() {
            this.isActiveQRcode = true
        },
        closeQRcodeModal() {
            this.isActiveQRcode = false
        },
    }
}
</script>

<style lang="scss" scoped>
.Share {
    width: 100%;
    height: 100vh;
    padding: 25px;
    background-image: url('/icon/card_bg.svg');
    background-repeat: no-repeat;
    background-size: cover;
    background-position: center;
    display: flex;
    &_ActionContainer {
        background: #f3f3f1cc;
        width: 100%;
        max-width: 500px;
        margin: 0 auto;
        border-radius: 5px;
        display: flex;
        flex-flow: column;
        align-items: center;
        padding: 30px;
    }
    &_CopyLinkContainer {
        background: #fff;
        border-radius: 5px;
        padding: 27px;
    }
    &_Link {
        @include font-size(25);
        margin-bottom: 20px;
        word-break: break-all;
        cursor: pointer;
    }
    &_CopyText {
        @include font-size(18);
        text-decoration: underline;
        color: #5780B4;
        font-weight: 600;
        line-height: 23px;
        cursor: pointer;
    }
    &_QRcodeText {
        margin-left: auto;
        margin-top: 40px;
        font-weight: 600;
        cursor: pointer;
    }
    &_QRcode {
        width: 80vw;
        max-width: 300px;
        position: fixed;
        z-index: 2;
        left: 0;
        right: 0;
        top: 10%;
        margin: auto;
    }
    &_ModalLayer {
        position: fixed;
        left: 0;
        right: 0;
        top: 0;
        bottom: 0;
        background: #00000066;
        cursor: pointer;
    }
}
.fade-enter-active {
  transition: opacity 300ms ease-out;
}
.fade-enter, .fade-leave-to {
    opacity: 0;
    position: absolute;
}
.fade-enter-to, .fade-leave {
    opacity: 1;
}

</style>
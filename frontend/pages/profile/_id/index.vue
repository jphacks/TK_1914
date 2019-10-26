<template lang="pug">
    div.Profile
        div.Profile_InfoContainer
            div.Profile_UserIcon
                el-avatar(src="/ui/man.svg" :size="160")
            div.Profile_UserName ねぎ
            div.Profile_MediaList
                div(v-for="media in ['twitter', 'instagram', 'facebook']" class="Profile_MediaItem")
                    img(:src="`/ui/icons/${media}.svg`" width="50px" hegiht="50px")
            div.Profile_Comment
                span 最近料理にハマっています。


</template>

<style lang="scss" scooped>
    .Profile {
        width: 100%;
        height: 100vh;
        padding: 25px;
        background-image: url('/ui/card_bg.svg');
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
        }
        &_UserName {
            @include font-size(35);
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
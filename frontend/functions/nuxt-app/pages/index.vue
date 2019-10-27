<template lang="pug">
    div.CreateCard
        div.CreateCard_Title Input your profile
        div.CreateCard_Form
            div.CreateCard_InputParts
                div.CreateCard_Label Profile image
                div.CreateCard_InputContainer._isBox
                    image-uploader(v-model="userInfo.image")
            div.CreateCard_InputParts
                div.CreateCard_Label
                    span.CreateCard_LabelText Nickname
                    span {{15 - userInfo.name.length}}
                div.CreateCard_InputContainer
                    input(v-model="userInfo.name" type="text" class="CreateCard_Input" maxlength="15" placeholder="スズキ")
            div.CreateCard_InputParts
                div.CreateCard_Label
                    span.CreateCard_LabelText Comment
                    span {{15 - userInfo.comment.length}}
                div.CreateCard_InputContainer
                    input(v-model="userInfo.comment" type="text" class="CreateCard_Input" maxlength="15" placeholder="最近料理にハマってます。")
            div.CreateCard_InputParts
                div.CreateCard_Label Media
                div.CreateCard_MediaList
                    div(v-for="media in mediaList" class="CreateCard_MediaItem" @click="activeMediaCard(media.name)")
                        div.CreateCard_MediaIcon
                            img(:src="`/icon/media/${media.name}.svg`" height="20px")
                        span.CreateCard_MediaLink
                            span.CreateCard_MediaLabel {{media.label}}
                            input(
                                :class="['CreateCard_MediaUsername', {'_isActive': isActive[media.name]}]"
                                type="text"
                                placeholder="username"
                                :ref="media.name"
                                v-model="userInfo.media[media.name]"
                                :disabled="!isActive[media.name]"
                                @blur="disabledMediaCard(media.name)")
        div.CreateCard_ButtonContaienr
            button(@click="creaetCard" class="CreateCard_Button") Create
</template>

<script>
import { mapActions } from 'vuex'

import imageUploader from '~/components/create/imageUploader'
export default {
    data() {
        return {
            userInfo: {
                image: '',
                name: '',
                comment: '',
                media: {
                    twitter: '',
                    facebook: '',
                    instagram: '',
                }
            },
            isActive: {
                twitter: false,
                facebook: false,
                instagram: false,
            },
            mediaList: [
                {
                    name: 'twitter',
                    label: 'twitter.com/',
                    id: 1
                },
                {
                    name: 'instagram',
                    label: 'instagram.com/',
                    id: 2
                },
                {
                    name: 'facebook',
                    label: 'facebook.com/',
                    id: 3
                },
            ]
        }
    },
    components: {
        imageUploader
    },
    methods: {
        ...mapActions('user', ['setUserId']),
        async creaetCard() {
            var links = this.mediaList.filter((media) => {
                return this.userInfo.media[media.name].length > 0
            })
            const param_links = links.map(link => {
                return {
                    id: link.id,
                    url: 'https://' + link.label + this.userInfo.media[link.name]
                }
            })
            const url = 'https://becky-server.herokuapp.com/api/v1/users/new'
            await this.$axios.$post(url, {
                'name': this.userInfo.name,
                'img': this.userInfo.image,
                'comment': this.userInfo.comment,
                'links': param_links
            }).then(res => {
                this.setUserId(res.id)
                this.$router.push('/share')
            })
        },
        activeMediaCard(type) {
            this.isActive[type] = true
            this.$nextTick(()=>{
                this.$refs[type][0].focus()
            })
        },
        disabledMediaCard(type) {
            this.isActive[type] = false
        },
    },
}
</script>

<style lang="scss" scoped>
.CreateCard {
    max-width: 600px;
    margin: 0 auto;
    padding: 45px;
    &_Title {
        @include font-size(25);
        font-weight: 600;
        color: $black;
        margin-bottom: 50px;
    }
    &_InputParts {
        margin-bottom: 60px;
        &:nth-last-child(n+2) {
            margin-bottom: 45px;
        }
    }
    &_Label {
        @include font-size(15);
        margin-bottom: 15px;
        display: flex;
    }
    &_InputContainer {
        display: flex;
        &._isBox {
            justify-content: center;
        }
    }
    &_LabelText {
        margin-right: auto;
    }
    &_Input {
        @include font-size(15);
        padding: 12px;
        border: solid 1px $light-gray;
        border-radius: 5px;
        width: 100%;
        outline: none;
    }
    &_MediaList {
        display: flex;
        flex-wrap: wrap;
    }
    &_MediaItem {
        display: flex;
        width: 100%;
        display: flex;
        align-items: center;
        border-radius: 5px;
        padding: 16px;
        font-weight: 300;
        box-shadow: 1px 1px 5px rgba(0, 0, 0, 0.15);
        cursor: pointer;
        color: $gray;
        &:nth-last-of-type(n+2) {
            margin-bottom: 20px;
        }
    }
    &_MediaIcon {
        width: 30px;
        text-align: center;
        margin-right: auto;
        margin-right: 20px;
    }
    &_MediaLink {
        @include font-size(14);
        display: flex;
        align-items: center;
    }
    &_MediaUsername {
        border: none;
        outline: none;
        border-radius: 3px;
        padding: 3px;
        margin-left: 3px;
        &._isActive {
            border: solid 2px $blue;
        }
        &::placeholder {
            color: $gray;
            font-weight: 600;
            @include font-size(14);
        }

    }
    &_Button {
        @include font-size(15);
        width: 100%;
        border: none;
        outline: none;
        background: #5780B4;
        color: #fff;
        border: solid 1px #5780B4;
        border-radius: 5px;
        padding: 10px 0;
        cursor: pointer;
    }
}
</style>


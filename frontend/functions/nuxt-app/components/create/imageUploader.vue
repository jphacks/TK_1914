<template lang="pug">
    label.ImageUploader
        div.ImageUploader_ImageContainer
            img(:class="['ImageUploader_Image', {'_isActive': isActive}]" :src="uploadedImage")
        input(v-show="false" type="file" v-on:change="onFileChange")
</template>

<script>
export default {
    name: 'ImageUploader',
    data() {
        return {
            uploadedImage: '/icon/user.svg',
            isActive: false
        };
    },
    methods: {
        onFileChange(e) {
            this.isActive = true
            let files = e.target.files || e.dataTransfer.files;
            this.createImage(files[0]);
        },
        createImage(file) {
            let reader = new FileReader();
            reader.onload = (e) => {
                this.uploadedImage = e.target.result;
                this.$emit('input', e.target.result)
            };
            reader.readAsDataURL(file);
        },
    }
}
</script>

<style lang="scss">
.ImageUploader{
    &_ImageContainer {
        width: 180px;
        height: 180px;
        border: solid 1px $gray;
        border-radius: 50%;
        display: flex;
        align-items: center;
        justify-content: center;
        position: relative;
        cursor: pointer;
        overflow: hidden;
    }
    &_Image {
        width: 60px;
        position: absolute;
        z-index: 2;
        &._isActive {
            width: 100%;
        }
    }
}
</style>
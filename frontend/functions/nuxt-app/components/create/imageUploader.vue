<template lang="pug">
    div.ImageUploader
        el-upload(
            class="ImageUploader_Box"
            action="https://jsonplaceholder.typicode.com/posts/"
            :show-file-list="false"
            :on-success="handleAvatarSuccess"
            :before-upload="beforeAvatarUpload")
            img(v-if="imageUrl" :src="imageUrl" class="ImageUploader_Avater")
            div(v-else class="ImageUploader_BoxIcon")
</template>

<script>
export default {
    name: 'ImageUploader',
    data() {
        return {
            imageUrl: ''
        };
    },
    methods: {
        handleAvatarSuccess(res, file) {
            this.imageUrl = URL.createObjectURL(file.raw);
        },
        beforeAvatarUpload(file) {
            const isJPG = file.type === 'image/jpeg';
            const isLt2M = file.size / 1024 / 1024 < 2;
        if (!isJPG) {
            this.$message.error('Avatar picture must be JPG format!');
        }
        if (!isLt2M) {
            this.$message.error('Avatar picture size can not exceed 2MB!');
        }
        return isJPG && isLt2M;
      }
    }
}
</script>

<style lang="scss">
.ImageUploader{
    &_Box .el-upload {
        border: 1px dashed #d9d9d9;
        border-radius: 50%;
        cursor: pointer;
        position: relative;
        overflow: hidden;
    }
    &_Box .el-upload:hover {
        border-color: #409EFF;
    }
    &_BoxIcon {
        font-size: 28px;
        color: #8c939d;
        width: 178px;
        height: 178px;
        text-align: center;
        &::after {
            content: url('/icon/user.svg');
            margin: auto;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100%;
        }
    }
    &_Avater {
        width: 178px;
        height: 178px;
        display: block;
    }

}
</style>
<template>
  <div class="image-upload">
    <el-upload
      class="image-uploader"
      :action="uploadUrl"
      :headers="headers"
      :show-file-list="false"
      :before-upload="handleBeforeUpload"
      :on-success="handleSuccess"
      :on-error="handleError"
      :on-progress="handleProgress"
      :disabled="disabled"
      accept="image/jpeg,image/png,image/gif,image/webp,image/jpg"
    >
      <div v-if="imageUrl" class="uploaded-image">
        <el-image :src="imageUrl" fit="cover" class="preview-image" />
        <div class="image-actions">
          <el-button
            type="danger"
            size="small"
            circle
            @click.stop="handleRemove"
            :icon="Delete"
          />
        </div>
      </div>
      <div v-else class="upload-placeholder">
        <el-icon v-if="uploading" class="upload-icon rotating"><Loading /></el-icon>
        <el-icon v-else class="upload-icon"><Plus /></el-icon>
        <div v-if="uploading" class="upload-progress">
          <el-progress
            type="circle"
            :percentage="uploadProgress"
            :width="60"
            :stroke-width="4"
          />
        </div>
        <span v-else class="upload-text">{{ placeholder }}</span>
      </div>
    </el-upload>
    <div v-if="tip" class="upload-tip">{{ tip }}</div>
  </div>
</template>

<script setup>
import { ref, computed } from 'vue'
import { ElMessage } from 'element-plus'
import { Delete, Plus, Loading } from '@element-plus/icons-vue'
import { uploadImage, deleteImage } from '@/api/upload'

const props = defineProps({
  modelValue: {
    type: String,
    default: ''
  },
  placeholder: {
    type: String,
    default: '点击上传图片'
  },
  tip: {
    type: String,
    default: '支持 JPG、PNG、GIF、WebP 格式，大小不超过 10MB'
  },
  disabled: {
    type: Boolean,
    default: false
  }
})

const emit = defineEmits(['update:modelValue'])

const uploadUrl = computed(() => `${import.meta.env.VITE_API_BASE_URL || '/api'}/upload/image`)
const imageUrl = ref(props.modelValue)
const uploading = ref(false)
const uploadProgress = ref(0)
const headers = computed(() => {
  const token = localStorage.getItem('token')
  return token ? { Authorization: `Bearer ${token}` } : {}
})

const handleBeforeUpload = (file) => {
  const isValidType = ['image/jpeg', 'image/png', 'image/gif', 'image/webp', 'image/jpg'].includes(file.type)
  const isLt10M = file.size / 1024 / 1024 < 10

  if (!isValidType) {
    ElMessage.error('只能上传 JPG、PNG、GIF、WebP 格式的图片')
    return false
  }
  if (!isLt10M) {
    ElMessage.error('图片大小不能超过 10MB')
    return false
  }

  uploading.value = true
  uploadProgress.value = 0
  return true
}

const handleSuccess = (response) => {
  uploading.value = false
  uploadProgress.value = 100

  if (response.code === 200 && response.data && response.data.url) {
    imageUrl.value = response.data.url
    emit('update:modelValue', response.data.url)
    ElMessage.success('图片上传成功')
  } else {
    ElMessage.error(response.message || '图片上传失败')
  }
}

const handleError = (error) => {
  uploading.value = false
  uploadProgress.value = 0
  console.error('上传失败:', error)
  ElMessage.error('图片上传失败，请重试')
}

const handleProgress = (event) => {
  uploadProgress.value = Math.round(event.percent || 0)
}

const handleRemove = async () => {
  try {
    const currentUrl = imageUrl.value
    if (currentUrl) {
      await deleteImage(currentUrl)
    }
    imageUrl.value = ''
    emit('update:modelValue', '')
    ElMessage.success('图片已删除')
  } catch (error) {
    imageUrl.value = ''
    emit('update:modelValue', '')
  }
}
</script>

<style scoped>
.image-upload {
  width: 100%;
}

.image-uploader {
  width: 100%;
}

.image-uploader :deep(.el-upload) {
  width: 100%;
  border: 2px dashed #d9d9d9;
  border-radius: 8px;
  cursor: pointer;
  position: relative;
  overflow: hidden;
  transition: all 0.3s;
}

.image-uploader :deep(.el-upload:hover) {
  border-color: #409eff;
}

.upload-placeholder {
  width: 148px;
  height: 148px;
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: center;
  background: #fafafa;
  color: #999;
}

.upload-placeholder:hover {
  background: #f0f0f0;
}

.upload-icon {
  font-size: 28px;
  color: #999;
}

.upload-icon.rotating {
  animation: rotate 1s linear infinite;
}

@keyframes rotate {
  from { transform: rotate(0deg); }
  to { transform: rotate(360deg); }
}

.upload-text {
  margin-top: 8px;
  font-size: 12px;
  color: #999;
}

.upload-progress {
  display: flex;
  align-items: center;
  justify-content: center;
}

.uploaded-image {
  width: 148px;
  height: 148px;
  position: relative;
}

.preview-image {
  width: 100%;
  height: 100%;
  display: block;
}

.image-actions {
  position: absolute;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  background: rgba(0, 0, 0, 0.5);
  display: flex;
  align-items: center;
  justify-content: center;
  opacity: 0;
  transition: opacity 0.3s;
}

.uploaded-image:hover .image-actions {
  opacity: 1;
}

.upload-tip {
  margin-top: 8px;
  font-size: 12px;
  color: #999;
  line-height: 1.4;
}
</style>
<template>
  <div class="columns">
    <div class="column">
      <button class="like button is-ghost" @click="countLikes">
        {{ likes }} likes
      </button>
    </div>
    <div class="column">
      <button class="disLike button is-ghost" @click="countDisLikes">
        {{ dislikes }} dislikes
      </button>
    </div>
  </div>
</template>
<script>
export default {
  data() {
    return {
      likes: 0,
      dislikes: 0,
    };
  },
  mounted() {
    if (localStorage.likes || localStorage.dislikes) {
      this.likes = parseInt(localStorage.likes);
      this.dislikes = parseInt(localStorage.dislikes);
    }
  },
  methods: {
    countLikes: function () {
      this.likes = parseInt(this.likes) + 1;
      localStorage.likes = this.likes;
    },
    countDisLikes: function () {
      this.dislikes = parseInt(this.dislikes) + 1;
      localStorage.dislikes = this.dislikes;
    },
  },
};
</script>

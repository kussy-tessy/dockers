<template>
  <div>
    <button type="button" @click="append(i)">+</button>
    <button type="button" @click="remove(i)">-</button>
  </div>
</template>

<script>
export default {
  name: "DynamicTableButton",
  props: {
    i: Number,
    data: Array,
    temp: Object,
  },
  methods: {
    append: function (i) {
      this.data.splice(i + 1, 0, { ...this.temp });
      this.$emit("change");
    },
    remove: function (i) {
      if (this.data.length <= 1) return;
      this.data.splice(i, 1);
      this.$emit("change");
    },
  },
};
</script>
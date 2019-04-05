<template>
  <div id="app">
    <tree-view
      :model="model"
      category="children"
      :selection="selection"
      :onSelect="onSelect"
      :display="display"
      :strategies="strategies"
    />
  </div>
</template>

<script>
import { TreeView } from "@bosket/vue";

const app = {
  components: {
    "tree-view": TreeView
  },
  data() {
    return {
      msg: "Bosket Vue",
      model: [
        {
          id: "start",
          data: {},
          label: "شروع",
          children: [
            { label: "I am a childless leaf." },
            { label: "I am a also a childless leaf." }
          ]
        },
        { label: "" }
      ],
      strategies: {
        selection: ["single"],
        click: ["select"],
        fold: [() => false]
      },
      selection: []
    };
  },
  methods: {
    onSelect: function(newSelection) {
      // this.selection = newSelection;
      Event.$emit("openSidebar");
      // console.log(newSelection);
    },
    display: _ => {
      return _.label;
    }
  },
  mounted: () => {
    setTimeout(() => {
      new LeaderLine(
        $(".depth-0 > li:first-child .item")[0],
        $(".depth-1>li")[0],
        {
          color: "#bdc3c7",
          path: "grid",
          startSocket: "bottom",
          endSocket: "left",
          startPlug: "behind",
          size: 2,
          endPlug: "behind"
        }
      );

      new LeaderLine(
        $(".depth-0 > li:first-child .item")[0],
        $(".depth-1>li")[1],
        {
          color: "#bdc3c7",
          path: "grid",
          startSocket: "bottom",
          endSocket: "left",
          startPlug: "behind",
          size: 2,
          endPlug: "behind"
        }
      );
    }, 0);
  }
};

export default app;
</script>

<style>
#app {
  direction: ltr;
  text-align: left;
}
.m-content {
  width: 100%;
}
p {
  font-size: 2em;
  text-align: center;
}

.TreeView .item {
  background: #2c3e50;
  color: #fff;
  border-radius: 100%;
  padding: 10px;
}

.TreeView li {
  list-style: none;
  margin: 40px 0;
}
.TreeView ul {
  padding-left: 100px;
}

.TreeView > ul {
  padding-left: 0px;
}

.depth-0 > li:first-child {
  margin-top: 0px !important;
}
</style>

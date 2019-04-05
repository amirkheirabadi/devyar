<template>
  <div class="m-scrollable" data-scrollable="true" style="height: 700px;">
    <div
      class="m-portlet m-portlet--last m-portlet--head-lg m-portlet--responsive-mobile"
      id="main_portlet"
    >
      <div class="m-portlet__head">
        <div class="m-portlet__head-wrapper">
          <div class="m-portlet__head-caption">
            <div class="m-portlet__head-title">
              <span class="m-portlet__head-icon">
                <i class="flaticon-alarm"></i>
              </span>
              <h3 class="m-portlet__head-text">شروع بات</h3>
            </div>
          </div>
          <div class="m-portlet__head-tools">
            <a
              href="#"
              class="btn btn-success m-btn m-btn--icon m-btn--wide m-btn--md m--margin-right-10"
            >
              <span>
                <i class="la la-check"></i>
                <span>ذخیره</span>
              </span>
            </a>
            &nbsp
            <button
              v-on:click="closeSidebar"
              class="btn btn-secondary m-btn m-btn--icon m-btn--wide m-btn--md m--margin-right-10"
            >
              <span>
                <i class="la la-arrow-left"></i>
                <span>بازگشت</span>
              </span>
            </button>
          </div>
        </div>
      </div>
      <div class="m-portlet__body" id="sidebar_inner">
        <div id="siedbar_app">
          <div class="typing_widget">
            <popper
              trigger="click"
              :options="{
                      placement: 'top',
                    }"
            >
              <div class="popper">
                <h5>نمایش نشانگر تایپ</h5>

                <vue-slider formatter="+ {value} ثانیه" ref="slider1" :value.sync="value"></vue-slider>
                <button
                  type="button"
                  class="btn m-btn--pill m-btn--air btn-primary btn-sm m-btn m-btn--custom"
                >ذخیره</button>
              </div>

              <button class="btn" @click="openPopper" slot="reference">+2 ثانیه</button>
            </popper>
          </div>

          <div class="widget_setction text_widget">
            <div class="col-md-12 widget_header">
              <div class="col-md-2">
                <h5>فیلتر ها :</h5>
              </div>
              <div class="col-md-10"></div>
            </div>
            <div class="col-md-12 widget_body">
              <div class="widget_body_inner">
                <div class="row">
                  <div class="col-md-2">
                    <i class="flaticon-alarm widget_bot_logo"></i>
                  </div>
                  <div class="col-md-10">
                    <div class="form-group m-form__group">
                      <input
                        type="email"
                        class="form-control m-input"
                        id="exampleInputEmail1"
                        aria-describedbysidebar_inner="emailHelp"
                        placeholder="Enter email"
                      >
                    </div>
                    <div class="form-group m-form__group">
                      <input
                        type="email"
                        class="form-control m-input"
                        id="exampleInputEmail1"
                        aria-describedbysidebar_inner="emailHelp"
                        placeholder="Enter email"
                      >
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import vueSlider from "vue-slider-component";
import Popper from "vue-popperjs";

const siedbar = {
  data() {
    return {
      msg: "Bosket Vue",
      value: 1
    };
  },
  components: {
    vueSlider,
    Popper
  },
  methods: {
    closeSidebar: function() {
      $("#m_quick_sidebar_toggle").click();
    },
    openPopper: function() {
      setTimeout(() => {
        this.$refs.slider1.refresh();
      }, 50);
    }
  },
  mounted: function() {
    Event.$on("openSidebar", () => {
      this.closeSidebar();
    });
  }
};

export default siedbar;
</script>


<style>
.m-quick-sidebar.m-quick-sidebar--on {
  right: 0px !important;
  left: auto;
  box-shadow: 0px 0px 0px !important;
}

.m-quick-sidebar {
  width: 70% !important;
  left: auto;
  right: -70%;
}

#sidebar_tools {
  padding-left: 7px;
  padding-right: 7px;
}

#sidebar_tools_inner {
  background: #fff;
  padding: ;
}

#sidebar_inner {
  padding-right: 30px;
  padding-left: 50px;
}

.m-quick-sidebar.m-quick-sidebar--on {
  right: 0px !important;
  left: auto;
  background: transparent;
  box-shadow: 0px 0px 0px;
  margin: 10px;
  padding: 0px;
}

#sidebar_body {
  padding: 0px !important;
}

#sidebar_body .m-portlet__body {
  background: #f2f3f8;
  text-align: center;
}

.m-quick-sidebar .m-nav-grid > .m-nav-grid__row > .m-nav-grid__item {
  padding: 1.3rem 0.75rem;
}

.popper {
  background-color: #fff !important;
  padding: 10px !important;
}

/* Widgets */
.widget_setction {
  background: #fff;
  box-shadow: 0 0 10px 0 rgba(0, 0, 0, 0.13) !important;
}

.widget_header,
.widget_body {
  padding: 10px;
}
.widget_header {
  padding-top: 20px;
  border-bottom: 1px solid #e2e3e4;
}
.widget_bot_logo {
  background: #39aaf6;
  padding: 10px;
  color: #fff;
  border-radius: 50%;
  top: 10px;
  position: relative;
}

.typing_widget {
  margin-bottom: 50px;
}
.typing_widget .popper {
  box-shadow: 0 0 10px 0 rgba(0, 0, 0, 0.13) !important;
  width: 400px;
  padding: 30px !important;
}
.typing_widget .popper .vue-slider-tooltip {
  background: #6255e0 !important;
  border-color: #6255e0 !important;
  font-size: 13px;
}
.typing_widget .popper button {
  margin-top: 20px;
}
.typing_widget .vue-slider-component .vue-slider-process {
  background: #6255e0 !important;
}
.typing_widget .popper h5 {
  text-align: right;
  font-size: 15px;
  margin-bottom: 10px;
}
.typing_widget button {
  border-radius: 50%;
  font-size: 13px;
  color: #39aaf6;
  padding: 16px 3px;
  box-shadow: 0 0 10px 0 rgba(0, 0, 0, 0.13) !important;
}
</style>
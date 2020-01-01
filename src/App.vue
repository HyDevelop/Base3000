<template>
    <div id="app">
        <h1>数字缩短工具</h1>
        <h3>Chinese Number Compressor | Base 3036</h3>
    </div>
</template>

<script lang="ts">
    import {Component, Vue} from 'vue-property-decorator';

    import freqList from '@/freq-list-zh.json'

    @Component
    export default class App extends Vue
    {

    }
</script>

<style lang="scss">
    #app {
        font-family: 'Avenir', Helvetica, Arial, sans-serif;
        -webkit-font-smoothing: antialiased;
        -moz-osx-font-smoothing: grayscale;
        text-align: center;
        color: #2c3e50;
        margin-top: 60px;
    }
</style>

<template>
    <div id="app">
        <div id="title">
            <h1>数字缩短工具</h1>
            <h3>Chinese Number Compressor | Base 3036</h3>
        </div>

        <el-input type="textarea" :rows="5"
                placeholder="输入 | Input"
                v-model="input" id="input">
        </el-input>
    </div>
</template>

<script lang="ts">
    import {Component, Vue} from 'vue-property-decorator';

    import freqList from '@/freq-list-zh.json'

    @Component
    export default class App extends Vue
    {
        input: string;

    }
</script>

<style lang="scss">
    #title
    {
        margin-top: 60px;
        margin-bottom: 60px;
    }

    #input
    {
        margin: auto;
        max-width: 1200px;
    }

    #app
    {
        font-family: 'Avenir', Helvetica, Arial, sans-serif;
        -webkit-font-smoothing: antialiased;
        -moz-osx-font-smoothing: grayscale;
        text-align: center;
        color: #2c3e50;
    }
</style>

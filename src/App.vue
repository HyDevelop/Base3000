<template>
    <div id="app">
        <div id="title">
            <h1>数字缩短工具 | 三千进制</h1>
            <h3>Chinese Number Compressor | Base 3000</h3>
        </div>

        <div id="content">
            <el-input type="textarea" :rows="20" resize="none"
                      placeholder="十位数字 | Input Dec"
                      v-model="input" class="input" @input="onInputChange">
            </el-input>

            <el-input type="textarea" :rows="20" resize="none"
                      placeholder="三千进制 | Base 3000"
                      v-model="output" class="input" @input="onOutputChange">
            </el-input>
        </div>
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

    #content
    {
        margin: auto;
        max-width: 1200px;
        position: relative;
    }

    .input
    {
        width: 40%;
        margin: 10px;
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

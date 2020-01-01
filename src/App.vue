<template>
    <div id="app">
        <div id="title">
            <h1>数字缩短工具 | 三千进制</h1>
            <h3>Chinese Number Compressor | Base 3000</h3>
        </div>

        <el-row :gutter="20" id="content">
            <el-col :span="12">
                <el-input type="textarea" :rows="20" resize="none"
                          placeholder="十位数字 | Input Dec"
                          v-model="input" class="input" @input="onInputChange">
                </el-input>
            </el-col>
            <el-col :span="12">
                <el-input type="textarea" :rows="20" resize="none"
                          placeholder="三千进制 | Base 3000"
                          v-model="output" class="input" @input="onOutputChange">
                </el-input>
            </el-col>
        </el-row>
    </div>
</template>

<script lang="ts">
    import {Component, Vue} from 'vue-property-decorator';

    import freqList from '@/freq-list-zh.json'

    @Component
    export default class App extends Vue
    {
        input: string = '';
        output: string = '';

        onInputChange()
        {
            this.input = this.input.replace(/[^\d]/g, '');
        }

        onOutputChange()
        {

        }

        /**
         * Encode base 3000
         *
         * @param value
         * @param scheme Letter scheme used
         */
        encode(value: number, scheme = freqList)
        {
            const base = scheme.length;
            let result = '';

            while (value > 0)
            {
                // Calculate the dec digit
                const digit = value % base;

                // Add digit to result
                result = scheme[digit] + result;

                // Update value
                value = (value - digit) / base;
            }

            return result || scheme[0];
        }

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
        width: 100%;
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

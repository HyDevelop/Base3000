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
            this.output = this.input ? this.encode(+this.input) : '';
        }

        onOutputChange()
        {
            // Typing
            if (this.isTyping(this.output))
            {
                this.input = 'Typing... (Chinese chars only on the right side)';
                return;
            }

            this.input = '' + this.decode(this.output);
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

                // Find char from digit and add to result
                result = scheme[digit] + result;

                // Update value
                value = (value - digit) / base;
            }

            return result || scheme[0];
        }

        /**
         * Decode Base 3000
         *
         * @param value
         * @param scheme Letter scheme used
         */
        decode(value: string, scheme = freqList)
        {
            const base = scheme.length;

            return value.split('').reverse().reduce((sum, char, index) =>
            {
                // Find digit from char
                const digit = scheme.indexOf(char);

                // Not found scenario
                if (digit == -1) throw new Error(`未知字符 | Unknown Char: ${char}`);

                // Add value to sum
                return sum + digit * Math.pow(base, index);
            }, 0);
        }

        /**
         * Is typing with chinese IME or not
         *
         * @param str
         */
        isTyping(str: string)
        {
            const lower = str.toLowerCase();
            const english = "abcdefghijklmnopqrstuvwxyz";

            return lower.split('').filter(c => english.includes(c)).length > 0;
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

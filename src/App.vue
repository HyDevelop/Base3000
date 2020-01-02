<template>
    <div id="app">
        <div id="title">
            <h1>数字缩短工具 | 三千进制</h1>
            <h3>Chinese Number Compressor | Base 3000</h3>
        </div>

        <el-row :gutter="20" id="content">
            <el-col :span="12">
                <span class="label">↓ 十进制数 | Base 10 ↓</span>
                <el-input type="textarea" :rows="20" resize="none"
                          placeholder="十位数字 | Base 10"
                          v-model="input" class="input" @input="onInputChange">
                </el-input>
            </el-col>
            <el-col :span="12">
                <span class="label">↓ 三千进制 | Base 3000 ↓</span>
                <el-input type="textarea" :rows="20" resize="none"
                          placeholder="三千进制 | Base 3000"
                          v-model="output" class="input" @input="onOutputChange">
                </el-input>
            </el-col>
        </el-row>

        <div id="footer">
            <p>
                这个程序使用了最常用的 3000 个中文字符来把一串十进制很长的一串数字缩短到几个中文字符w<br>
                在上面输入来开始使用吧w<br>
            </p>
            <p>
                This program utilizes a list of 3000 most commonly used Chinese characters as digit bases to
                shorten very long numbers in base 10 into simply several Chinese characters in Base 3000.
            </p>
        </div>
    </div>
</template>

<script lang="ts">
    import {Component, Vue} from 'vue-property-decorator';
    const bigInt = require('big-integer');

    import freqList from '@/base3000.json'
    import {BigInteger} from 'big-integer';

    @Component
    export default class App extends Vue
    {
        input: string = '90000270170';
        output: string = '三千进制';

        onInputChange()
        {
            this.input = this.input.replace(/[^\d]/g, '');
            this.output = this.input ? this.encode(bigInt(this.input)) : '';
        }

        onOutputChange()
        {
            // Typing
            if (this.isTyping(this.output))
            {
                this.input = 'Typing... (Chinese chars only on the right side)';
                return;
            }

            // Check letters existence
            this.output = this.output.split('').filter(c => freqList.includes(c)).join('');

            this.input = this.decode(this.output).toString();
        }

        /**
         * Encode base 3000
         *
         * @param value
         * @param scheme Letter scheme used
         */
        encode(value: BigInteger, scheme = freqList)
        {
            const base = scheme.length;
            let result = '';

            while (!value.eq(0))
            {
                // Calculate the dec digit
                const digit = value.mod(base).toJSNumber();

                // Find char from digit and add to result
                result = scheme[digit] + result;

                // Update value
                value = value.subtract(digit).divide(base);
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
                if (digit == -1) throw new Error(`未知字符 | Unknown Char: '${char}'`);

                // Add value to sum
                return sum.add(bigInt(digit).multiply(bigInt(base).pow(index)));
            }, bigInt.zero);
        }

        /**
         * Is typing with chinese IME or not
         *
         * @param str
         */
        isTyping(str: string)
        {
            const lower = str.toLowerCase();
            const english = 'abcdefghijklmnopqrstuvwxyz';

            return lower.split('').filter(c => english.includes(c)).length > 0;
        }
    }
</script>

<style lang="scss">
    #title,#footer
    {
        margin-top: 60px;
        margin-bottom: 60px;
    }

    #content
    {
        margin-top: -20px;
        position: relative;
    }

    .label
    {
        display: inline-block;
        font-size: 15px;
        margin-bottom: 5px;
    }

    .input
    {
        width: 100%;
    }

    #app
    {
        font-family: 'Avenir', Helvetica, Arial, sans-serif;
        -webkit-font-smoothing: antialiased;
        -moz-osx-font-smoothing: grayscale;
        text-align: center;
        color: #2c3e50;

        margin: auto !important;
        max-width: 1000px;
    }
</style>

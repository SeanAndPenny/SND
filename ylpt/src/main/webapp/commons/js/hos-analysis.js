
function chart01(id) {
    var myChart = echarts.init(document.getElementById(id));
    var option = {
        tooltip: {
            trigger: 'item',
            axisPointer: {
                type: 'shadow'
            }
        },
        series: [
            {
                name: '医保人次占比',
                type: 'pie',
                hoverOffset: 6,
                center: ["20%", "47%"],
                radius: ['41%', '64%'],
                label: {
                    show: false
                },
                data: [
                    {
                        value: 80960,
                        name: '科技城医院',
                        itemStyle: {
                            color: '#88CA6D'
                        },
                    },
                    {
                        value: 70980,
                        name: '高新区医院',
                        itemStyle: {
                            color: '#3AA873'
                        },
                    },
                    {
                        value: 63890,
                        name: '明基医院',
                        itemStyle: {
                            color: '#0DAEF1'
                        },
                    },
                    {
                        value: 60900,
                        name: '苏大附一',
                        itemStyle: {
                            color: '#3992F0'
                        },
                    },
                    {
                        value: 58900,
                        name: '苏大附二',
                        itemStyle: {
                            color: '#1572D5'
                        },
                    },
                    {
                        value: 45463,
                        name: '苏州市立（本部）',
                        itemStyle: {
                            color: '#7187F5'
                        },
                    },
                    {
                        value: 56721,
                        name: '苏州市立（东区）',
                        itemStyle: {
                            color: '#826CD1'
                        },
                    },
                    {
                        value: 12345,
                        name: '苏州市立（北区）',
                        itemStyle: {
                            color: '#A079E1'
                        },
                    },
                    {
                        value: 34322,
                        name: '中医院',
                        itemStyle: {
                            color: '#C779E1'
                        },
                    },
                    {
                        value: 21544,
                        name: '九龙医院',
                        itemStyle: {
                            color: '#E97CDB'
                        },
                    },
                    {
                        value: 10000,
                        name: '广济医院',
                        itemStyle: {
                            color: '#E97CA0'
                        },
                    },
                    {
                        value: 17000,
                        name: '第五医院',
                        itemStyle: {
                            color: '#E9987C'
                        },
                    },
                ],
                labelLine: {
                    show: false,
                    length: 5,
                    length2: 10
                }
            }
        ]
    };
    myChart.setOption(option)
    return myChart
};

function chart02(id) {
    var myChart = echarts.init(document.getElementById(id));
    var option = {
        tooltip: {
            trigger: 'item',
            axisPointer: {
                type: 'shadow'
            }
        },
        series: [
            {
                name: '医保人次占比',
                type: 'pie',
                hoverOffset: 6,
                center: ["20%", "47%"],
                radius: ['41%', '64%'],
                label: {
                    show: false
                },
                data: [
                    {
                        value: 80960,
                        name: '科技城医院',
                        itemStyle: {
                            color: '#88CA6D'
                        },
                    },
                    {
                        value: 70980,
                        name: '高新区医院',
                        itemStyle: {
                            color: '#3AA873'
                        },
                    },
                    {
                        value: 63890,
                        name: '明基医院',
                        itemStyle: {
                            color: '#0DAEF1'
                        },
                    },
                    {
                        value: 60900,
                        name: '苏大附一',
                        itemStyle: {
                            color: '#3992F0'
                        },
                    },
                    {
                        value: 58900,
                        name: '苏大附二',
                        itemStyle: {
                            color: '#1572D5'
                        },
                    },
                    {
                        value: 45463,
                        name: '苏州市立（本部）',
                        itemStyle: {
                            color: '#7187F5'
                        },
                    },
                    {
                        value: 56721,
                        name: '苏州市立（东区）',
                        itemStyle: {
                            color: '#826CD1'
                        },
                    },
                    {
                        value: 12345,
                        name: '苏州市立（北区）',
                        itemStyle: {
                            color: '#A079E1'
                        },
                    },
                    {
                        value: 34322,
                        name: '中医院',
                        itemStyle: {
                            color: '#C779E1'
                        },
                    },
                    {
                        value: 21544,
                        name: '九龙医院',
                        itemStyle: {
                            color: '#E97CDB'
                        },
                    },
                    {
                        value: 10000,
                        name: '广济医院',
                        itemStyle: {
                            color: '#E97CA0'
                        },
                    },
                    {
                        value: 17000,
                        name: '第五医院',
                        itemStyle: {
                            color: '#E9987C'
                        },
                    },
                ],
                labelLine: {
                    show: false,
                    length: 5,
                    length2: 10
                }
            }
        ]
    };
    myChart.setOption(option)
    return myChart
};

function chart03(id) {
    var myChart = echarts.init(document.getElementById(id));
    var option = {
        tooltip: {
            trigger: 'axis',
            axisPointer: {
                type: 'shadow',
            }
        },
        grid: {
            containLabel: true,
            top: '34%',
            right: '5%',
            left: '3%',
            bottom: '6%'
        },
        yAxis: [{
            name: '万人',
            nameGap: 10,
            nameTextStyle: {
                color: '#333333',
                fontSize: 12
            },
            axisLabel: {
                color: '#333333',
                fontSize: 12
            },
            axisTick: {
                show: false
            },
            axisLine: {
                lineStyle:{
                    color:'rgba(219, 225, 229, .75)'
                }
            },
            splitLine: {
                show: true,
                lineStyle:{
                    color:'rgba(219, 225, 229, .75)'
                }
            }
        }],
        xAxis: [{
            type: 'category',
            data: ['1月','2月','3月','4月','5月','6月','7月','8月','9月','10月','11月','12月',],
            axisLine: {
                lineStyle:{
                    color:'rgba(219, 225, 229, .75)'
                }
            },
            boundaryGap: false,
            axisTick: {
                show: false
            },
            axisLabel: {
                margin: 10,
                color: '#333333',
                textStyle: {
                    fontSize: 12
                }
            },
            splitArea: {
                show: true,
                areaStyle: {
                    color: ['rgba(255,255,255,.01)', 'rgba(213, 228, 255, .3)']
                }
            }
        }],
        series: [
            {
                name: '科技城医院',
                type: 'line',
                data: [33, 44, 40, 32, 50, 12, 55, 23, 13, 24, 56, 45],
                symbol:'circle',
                symbolSize: 6,
                smooth: true,
                itemStyle: {
                    color: '#C3E4B6',
                    borderColor:'#88CA6D'
                },
                lineStyle:{
                    width:1,
                    color:'#88CA6D'
                }
            }, {
                name: '高新区医院',
                type: 'line',
                data: [33, 23, 43, 60, 45, 50, 67, 45, 33, 51, 23, 44],
                symbol:'circle',
                symbolSize: 6,
                smooth: true,
                itemStyle: {
                    color: '#9CD3B9',
                    borderColor:'#3AA873'
                },
                lineStyle:{
                    width:1,
                    color:'#3AA873'
                }
            }, {
                name: '明基医院',
                type: 'line',
                data: [23, 43, 33, 50, 35, 34, 60, 40, 37, 58, 28, 48],
                symbol:'circle',
                symbolSize: 6,
                smooth: true,
                itemStyle: {
                    color: '#86D6F8',
                    borderColor:'#0DAEF1'
                },
                lineStyle:{
                    width:1,
                    color:'#0DAEF1'
                }
            },{
                name: '苏大附一',
                type: 'line',
                data: [53, 23, 37, 40, 45, 24, 50, 45, 47, 48, 38, 49],
                symbol:'circle',
                symbolSize: 6,
                smooth: true,
                itemStyle: {
                    color: '#9CC8F7',
                    borderColor:'#3992F0'
                },
                lineStyle:{
                    width:1,
                    color:'#3992F0'
                }
            },{
                name: '苏大附二',
                type: 'line',
                data: [57, 25, 39, 30, 35, 54, 40, 35, 41, 38, 30, 39],
                symbol:'circle',
                symbolSize: 6,
                smooth: true,
                itemStyle: {
                    color: '#8AB8EA',
                    borderColor:'#1572D5'
                },
                lineStyle:{
                    width:1,
                    color:'#1572D5'
                }
            },{
                name: '市立（本部）',
                type: 'line',
                data: [53, 29, 49, 20, 15, 64, 20, 15, 21, 48, 20, 19],
                symbol:'circle',
                symbolSize: 6,
                smooth: true,
                itemStyle: {
                    color: '#B8C3FA',
                    borderColor:'#7187F5'
                },
                lineStyle:{
                    width:1,
                    color:'#7187F5'
                }
            },{
                name: '市立（东区）',
                type: 'line',
                data: [43, 39, 46, 30, 19, 54, 27, 17, 29, 49, 40, 29],
                symbol:'circle',
                symbolSize: 6,
                smooth: true,
                itemStyle: {
                    color: '#C0B5E8',
                    borderColor:'#826CD1'
                },
                lineStyle:{
                    width:1,
                    color:'#826CD1'
                }
            },{
                name: '市立（北区）',
                type: 'line',
                data: [73, 69, 66, 50, 49, 54, 77, 57, 69, 59, 50, 69],
                symbol:'circle',
                symbolSize: 6,
                smooth: true,
                itemStyle: {
                    color: '#CFBCF0',
                    borderColor:'#A079E1'
                },
                lineStyle:{
                    width:1,
                    color:'#A079E1'
                }
            },{
                name: '中医院',
                type: 'line',
                data: [75, 60, 56, 30, 39, 58, 79, 67, 79, 49, 58, 60],
                symbol:'circle',
                symbolSize: 6,
                smooth: true,
                itemStyle: {
                    color: '#E3BCF0',
                    borderColor:'#C779E1'
                },
                lineStyle:{
                    width:1,
                    color:'#C779E1'
                }
            },{
                name: '九龙医院',
                type: 'line',
                data: [70, 62, 56, 52, 45, 44, 57, 47, 49, 49, 40, 39],
                symbol:'circle',
                symbolSize: 6,
                smooth: true,
                itemStyle: {
                    color: '#F4BDED',
                    borderColor:'#E97CDB'
                },
                lineStyle:{
                    width:1,
                    color:'#E97CDB'
                }
            },{
                name: '广济医院',
                type: 'line',
                data: [53, 59, 56, 50, 59, 54, 57, 47, 39, 49, 50, 59],
                symbol:'circle',
                symbolSize: 6,
                smooth: true,
                itemStyle: {
                    color: '#F3B8CC',
                    borderColor:'#E97CA0'
                },
                lineStyle:{
                    width:1,
                    color:'#E97CA0'
                }
            },{
                name: '第五医院',
                type: 'line',
                data: [43, 45, 46, 40, 49, 44, 47, 37, 49, 29, 30, 49],
                symbol:'circle',
                symbolSize: 6,
                smooth: true,
                itemStyle: {
                    color: '#F3C7B8',
                    borderColor:'#E9987C'
                },
                lineStyle:{
                    width:1,
                    color:'#E9987C'
                }
            },
        ]
    };
    myChart.setOption(option)
    return myChart
};

function chart04(id) {
    var myChart = echarts.init(document.getElementById(id));
    var option = {
        tooltip: {
            trigger: 'axis',
            axisPointer: {
                type: 'shadow',
            }
        },
        grid: {
            containLabel: true,
            top: '34%',
            right: '5%',
            left: '3%',
            bottom: '6%'
        },
        yAxis: [{
            name: '万人',
            nameGap: 10,
            nameTextStyle: {
                color: '#333333',
                fontSize: 12
            },
            axisLabel: {
                color: '#333333',
                fontSize: 12
            },
            axisTick: {
                show: false
            },
            axisLine: {
                lineStyle:{
                    color:'rgba(219, 225, 229, .75)'
                }
            },
            splitLine: {
                show: true,
                lineStyle:{
                    color:'rgba(219, 225, 229, .75)'
                }
            }
        }],
        xAxis: [{
            type: 'category',
            data: ['1月','2月','3月','4月','5月','6月','7月','8月','9月','10月','11月','12月',],
            axisLine: {
                lineStyle:{
                    color:'rgba(219, 225, 229, .75)'
                }
            },
            boundaryGap: false,
            axisTick: {
                show: false
            },
            axisLabel: {
                margin: 10,
                color: '#333333',
                textStyle: {
                    fontSize: 12
                }
            },
            splitArea: {
                show: true,
                areaStyle: {
                    color: ['rgba(255,255,255,.01)', 'rgba(213, 228, 255, .3)']
                }
            }
        }],
        series: [
            {
                name: '科技城医院',
                type: 'line',
                data: [33, 44, 40, 32, 50, 12, 55, 23, 13, 24, 56, 45],
                symbol:'circle',
                symbolSize: 6,
                smooth: true,
                itemStyle: {
                    color: '#C3E4B6',
                    borderColor:'#88CA6D'
                },
                lineStyle:{
                    width:1,
                    color:'#88CA6D'
                }
            }, {
                name: '高新区医院',
                type: 'line',
                data: [33, 23, 43, 60, 45, 50, 67, 45, 33, 51, 23, 44],
                symbol:'circle',
                symbolSize: 6,
                smooth: true,
                itemStyle: {
                    color: '#9CD3B9',
                    borderColor:'#3AA873'
                },
                lineStyle:{
                    width:1,
                    color:'#3AA873'
                }
            }, {
                name: '明基医院',
                type: 'line',
                data: [23, 43, 33, 50, 35, 34, 60, 40, 37, 58, 28, 48],
                symbol:'circle',
                symbolSize: 6,
                smooth: true,
                itemStyle: {
                    color: '#86D6F8',
                    borderColor:'#0DAEF1'
                },
                lineStyle:{
                    width:1,
                    color:'#0DAEF1'
                }
            },{
                name: '苏大附一',
                type: 'line',
                data: [53, 23, 37, 40, 45, 24, 50, 45, 47, 48, 38, 49],
                symbol:'circle',
                symbolSize: 6,
                smooth: true,
                itemStyle: {
                    color: '#9CC8F7',
                    borderColor:'#3992F0'
                },
                lineStyle:{
                    width:1,
                    color:'#3992F0'
                }
            },{
                name: '苏大附二',
                type: 'line',
                data: [57, 25, 39, 30, 35, 54, 40, 35, 41, 38, 30, 39],
                symbol:'circle',
                symbolSize: 6,
                smooth: true,
                itemStyle: {
                    color: '#8AB8EA',
                    borderColor:'#1572D5'
                },
                lineStyle:{
                    width:1,
                    color:'#1572D5'
                }
            },{
                name: '市立（本部）',
                type: 'line',
                data: [53, 29, 49, 20, 15, 64, 20, 15, 21, 48, 20, 19],
                symbol:'circle',
                symbolSize: 6,
                smooth: true,
                itemStyle: {
                    color: '#B8C3FA',
                    borderColor:'#7187F5'
                },
                lineStyle:{
                    width:1,
                    color:'#7187F5'
                }
            },{
                name: '市立（东区）',
                type: 'line',
                data: [43, 39, 46, 30, 19, 54, 27, 17, 29, 49, 40, 29],
                symbol:'circle',
                symbolSize: 6,
                smooth: true,
                itemStyle: {
                    color: '#C0B5E8',
                    borderColor:'#826CD1'
                },
                lineStyle:{
                    width:1,
                    color:'#826CD1'
                }
            },{
                name: '市立（北区）',
                type: 'line',
                data: [73, 69, 66, 50, 49, 54, 77, 57, 69, 59, 50, 69],
                symbol:'circle',
                symbolSize: 6,
                smooth: true,
                itemStyle: {
                    color: '#CFBCF0',
                    borderColor:'#A079E1'
                },
                lineStyle:{
                    width:1,
                    color:'#A079E1'
                }
            },{
                name: '中医院',
                type: 'line',
                data: [75, 60, 56, 30, 39, 58, 79, 67, 79, 49, 58, 60],
                symbol:'circle',
                symbolSize: 6,
                smooth: true,
                itemStyle: {
                    color: '#E3BCF0',
                    borderColor:'#C779E1'
                },
                lineStyle:{
                    width:1,
                    color:'#C779E1'
                }
            },{
                name: '九龙医院',
                type: 'line',
                data: [70, 62, 56, 52, 45, 44, 57, 47, 49, 49, 40, 39],
                symbol:'circle',
                symbolSize: 6,
                smooth: true,
                itemStyle: {
                    color: '#F4BDED',
                    borderColor:'#E97CDB'
                },
                lineStyle:{
                    width:1,
                    color:'#E97CDB'
                }
            },{
                name: '广济医院',
                type: 'line',
                data: [53, 59, 56, 50, 59, 54, 57, 47, 39, 49, 50, 59],
                symbol:'circle',
                symbolSize: 6,
                smooth: true,
                itemStyle: {
                    color: '#F3B8CC',
                    borderColor:'#E97CA0'
                },
                lineStyle:{
                    width:1,
                    color:'#E97CA0'
                }
            },{
                name: '第五医院',
                type: 'line',
                data: [43, 45, 46, 40, 49, 44, 47, 37, 49, 29, 30, 49],
                symbol:'circle',
                symbolSize: 6,
                smooth: true,
                itemStyle: {
                    color: '#F3C7B8',
                    borderColor:'#E9987C'
                },
                lineStyle:{
                    width:1,
                    color:'#E9987C'
                }
            },
        ]
    };
    myChart.setOption(option)
    return myChart
};

function chart05(id) {
    var myChart = echarts.init(document.getElementById(id));
    var option = {
        tooltip: {
            trigger: 'axis',
            axisPointer: {
                type: 'shadow',
            }
        },
        grid: {
            containLabel: true,
            top: '34%',
            right: '5%',
            left: '3%',
            bottom: '6%'
        },
        yAxis: [{
            name: '万人',
            nameGap: 10,
            nameTextStyle: {
                color: '#333333',
                fontSize: 12
            },
            axisLabel: {
                color: '#333333',
                fontSize: 12
            },
            axisTick: {
                show: false
            },
            axisLine: {
                lineStyle:{
                    color:'rgba(219, 225, 229, .75)'
                }
            },
            splitLine: {
                show: true,
                lineStyle:{
                    color:'rgba(219, 225, 229, .75)'
                }
            }
        }],
        xAxis: [{
            type: 'category',
            data: ['1月','2月','3月','4月','5月','6月','7月','8月','9月','10月','11月','12月',],
            axisLine: {
                lineStyle:{
                    color:'rgba(219, 225, 229, .75)'
                }
            },
            boundaryGap: false,
            axisTick: {
                show: false
            },
            axisLabel: {
                margin: 10,
                color: '#333333',
                textStyle: {
                    fontSize: 12
                }
            },
            splitArea: {
                show: true,
                areaStyle: {
                    color: ['rgba(255,255,255,.01)', 'rgba(213, 228, 255, .3)']
                }
            }
        }],
        series: [
            {
                name: '科技城医院',
                type: 'line',
                data: [33, 44, 40, 32, 50, 12, 55, 23, 13, 24, 56, 45],
                symbol:'circle',
                symbolSize: 6,
                smooth: true,
                itemStyle: {
                    color: '#C3E4B6',
                    borderColor:'#88CA6D'
                },
                lineStyle:{
                    width:1,
                    color:'#88CA6D'
                }
            }, {
                name: '高新区医院',
                type: 'line',
                data: [33, 23, 43, 60, 45, 50, 67, 45, 33, 51, 23, 44],
                symbol:'circle',
                symbolSize: 6,
                smooth: true,
                itemStyle: {
                    color: '#9CD3B9',
                    borderColor:'#3AA873'
                },
                lineStyle:{
                    width:1,
                    color:'#3AA873'
                }
            }, {
                name: '明基医院',
                type: 'line',
                data: [23, 43, 33, 50, 35, 34, 60, 40, 37, 58, 28, 48],
                symbol:'circle',
                symbolSize: 6,
                smooth: true,
                itemStyle: {
                    color: '#86D6F8',
                    borderColor:'#0DAEF1'
                },
                lineStyle:{
                    width:1,
                    color:'#0DAEF1'
                }
            },{
                name: '苏大附一',
                type: 'line',
                data: [53, 23, 37, 40, 45, 24, 50, 45, 47, 48, 38, 49],
                symbol:'circle',
                symbolSize: 6,
                smooth: true,
                itemStyle: {
                    color: '#9CC8F7',
                    borderColor:'#3992F0'
                },
                lineStyle:{
                    width:1,
                    color:'#3992F0'
                }
            },{
                name: '苏大附二',
                type: 'line',
                data: [57, 25, 39, 30, 35, 54, 40, 35, 41, 38, 30, 39],
                symbol:'circle',
                symbolSize: 6,
                smooth: true,
                itemStyle: {
                    color: '#8AB8EA',
                    borderColor:'#1572D5'
                },
                lineStyle:{
                    width:1,
                    color:'#1572D5'
                }
            },{
                name: '市立（本部）',
                type: 'line',
                data: [53, 29, 49, 20, 15, 64, 20, 15, 21, 48, 20, 19],
                symbol:'circle',
                symbolSize: 6,
                smooth: true,
                itemStyle: {
                    color: '#B8C3FA',
                    borderColor:'#7187F5'
                },
                lineStyle:{
                    width:1,
                    color:'#7187F5'
                }
            },{
                name: '市立（东区）',
                type: 'line',
                data: [43, 39, 46, 30, 19, 54, 27, 17, 29, 49, 40, 29],
                symbol:'circle',
                symbolSize: 6,
                smooth: true,
                itemStyle: {
                    color: '#C0B5E8',
                    borderColor:'#826CD1'
                },
                lineStyle:{
                    width:1,
                    color:'#826CD1'
                }
            },{
                name: '市立（北区）',
                type: 'line',
                data: [73, 69, 66, 50, 49, 54, 77, 57, 69, 59, 50, 69],
                symbol:'circle',
                symbolSize: 6,
                smooth: true,
                itemStyle: {
                    color: '#CFBCF0',
                    borderColor:'#A079E1'
                },
                lineStyle:{
                    width:1,
                    color:'#A079E1'
                }
            },{
                name: '中医院',
                type: 'line',
                data: [75, 60, 56, 30, 39, 58, 79, 67, 79, 49, 58, 60],
                symbol:'circle',
                symbolSize: 6,
                smooth: true,
                itemStyle: {
                    color: '#E3BCF0',
                    borderColor:'#C779E1'
                },
                lineStyle:{
                    width:1,
                    color:'#C779E1'
                }
            },{
                name: '九龙医院',
                type: 'line',
                data: [70, 62, 56, 52, 45, 44, 57, 47, 49, 49, 40, 39],
                symbol:'circle',
                symbolSize: 6,
                smooth: true,
                itemStyle: {
                    color: '#F4BDED',
                    borderColor:'#E97CDB'
                },
                lineStyle:{
                    width:1,
                    color:'#E97CDB'
                }
            },{
                name: '广济医院',
                type: 'line',
                data: [53, 59, 56, 50, 59, 54, 57, 47, 39, 49, 50, 59],
                symbol:'circle',
                symbolSize: 6,
                smooth: true,
                itemStyle: {
                    color: '#F3B8CC',
                    borderColor:'#E97CA0'
                },
                lineStyle:{
                    width:1,
                    color:'#E97CA0'
                }
            },{
                name: '第五医院',
                type: 'line',
                data: [43, 45, 46, 40, 49, 44, 47, 37, 49, 29, 30, 49],
                symbol:'circle',
                symbolSize: 6,
                smooth: true,
                itemStyle: {
                    color: '#F3C7B8',
                    borderColor:'#E9987C'
                },
                lineStyle:{
                    width:1,
                    color:'#E9987C'
                }
            },
        ]
    };
    myChart.setOption(option)
    return myChart
};

function chart06(id) {
    var myChart = echarts.init(document.getElementById(id));
    var option = {
        tooltip: {
            trigger: 'axis',
            axisPointer: {
                type: 'shadow',
            }
        },
        grid: {
            containLabel: true,
            top: '34%',
            right: '5%',
            left: '3%',
            bottom: '6%'
        },
        yAxis: [{
            name: '万人',
            nameGap: 10,
            nameTextStyle: {
                color: '#333333',
                fontSize: 12
            },
            axisLabel: {
                color: '#333333',
                fontSize: 12
            },
            axisTick: {
                show: false
            },
            axisLine: {
                lineStyle:{
                    color:'rgba(219, 225, 229, .75)'
                }
            },
            splitLine: {
                show: true,
                lineStyle:{
                    color:'rgba(219, 225, 229, .75)'
                }
            }
        }],
        xAxis: [{
            type: 'category',
            data: ['1月','2月','3月','4月','5月','6月','7月','8月','9月','10月','11月','12月',],
            axisLine: {
                lineStyle:{
                    color:'rgba(219, 225, 229, .75)'
                }
            },
            boundaryGap: false,
            axisTick: {
                show: false
            },
            axisLabel: {
                margin: 10,
                color: '#333333',
                textStyle: {
                    fontSize: 12
                }
            },
            splitArea: {
                show: true,
                areaStyle: {
                    color: ['rgba(255,255,255,.01)', 'rgba(213, 228, 255, .3)']
                }
            }
        }],
        series: [
            {
                name: '科技城医院',
                type: 'line',
                data: [33, 44, 40, 32, 50, 12, 55, 23, 13, 24, 56, 45],
                symbol:'circle',
                symbolSize: 6,
                smooth: true,
                itemStyle: {
                    color: '#C3E4B6',
                    borderColor:'#88CA6D'
                },
                lineStyle:{
                    width:1,
                    color:'#88CA6D'
                }
            }, {
                name: '高新区医院',
                type: 'line',
                data: [33, 23, 43, 60, 45, 50, 67, 45, 33, 51, 23, 44],
                symbol:'circle',
                symbolSize: 6,
                smooth: true,
                itemStyle: {
                    color: '#9CD3B9',
                    borderColor:'#3AA873'
                },
                lineStyle:{
                    width:1,
                    color:'#3AA873'
                }
            }, {
                name: '明基医院',
                type: 'line',
                data: [23, 43, 33, 50, 35, 34, 60, 40, 37, 58, 28, 48],
                symbol:'circle',
                symbolSize: 6,
                smooth: true,
                itemStyle: {
                    color: '#86D6F8',
                    borderColor:'#0DAEF1'
                },
                lineStyle:{
                    width:1,
                    color:'#0DAEF1'
                }
            },{
                name: '苏大附一',
                type: 'line',
                data: [53, 23, 37, 40, 45, 24, 50, 45, 47, 48, 38, 49],
                symbol:'circle',
                symbolSize: 6,
                smooth: true,
                itemStyle: {
                    color: '#9CC8F7',
                    borderColor:'#3992F0'
                },
                lineStyle:{
                    width:1,
                    color:'#3992F0'
                }
            },{
                name: '苏大附二',
                type: 'line',
                data: [57, 25, 39, 30, 35, 54, 40, 35, 41, 38, 30, 39],
                symbol:'circle',
                symbolSize: 6,
                smooth: true,
                itemStyle: {
                    color: '#8AB8EA',
                    borderColor:'#1572D5'
                },
                lineStyle:{
                    width:1,
                    color:'#1572D5'
                }
            },{
                name: '市立（本部）',
                type: 'line',
                data: [53, 29, 49, 20, 15, 64, 20, 15, 21, 48, 20, 19],
                symbol:'circle',
                symbolSize: 6,
                smooth: true,
                itemStyle: {
                    color: '#B8C3FA',
                    borderColor:'#7187F5'
                },
                lineStyle:{
                    width:1,
                    color:'#7187F5'
                }
            },{
                name: '市立（东区）',
                type: 'line',
                data: [43, 39, 46, 30, 19, 54, 27, 17, 29, 49, 40, 29],
                symbol:'circle',
                symbolSize: 6,
                smooth: true,
                itemStyle: {
                    color: '#C0B5E8',
                    borderColor:'#826CD1'
                },
                lineStyle:{
                    width:1,
                    color:'#826CD1'
                }
            },{
                name: '市立（北区）',
                type: 'line',
                data: [73, 69, 66, 50, 49, 54, 77, 57, 69, 59, 50, 69],
                symbol:'circle',
                symbolSize: 6,
                smooth: true,
                itemStyle: {
                    color: '#CFBCF0',
                    borderColor:'#A079E1'
                },
                lineStyle:{
                    width:1,
                    color:'#A079E1'
                }
            },{
                name: '中医院',
                type: 'line',
                data: [75, 60, 56, 30, 39, 58, 79, 67, 79, 49, 58, 60],
                symbol:'circle',
                symbolSize: 6,
                smooth: true,
                itemStyle: {
                    color: '#E3BCF0',
                    borderColor:'#C779E1'
                },
                lineStyle:{
                    width:1,
                    color:'#C779E1'
                }
            },{
                name: '九龙医院',
                type: 'line',
                data: [70, 62, 56, 52, 45, 44, 57, 47, 49, 49, 40, 39],
                symbol:'circle',
                symbolSize: 6,
                smooth: true,
                itemStyle: {
                    color: '#F4BDED',
                    borderColor:'#E97CDB'
                },
                lineStyle:{
                    width:1,
                    color:'#E97CDB'
                }
            },{
                name: '广济医院',
                type: 'line',
                data: [53, 59, 56, 50, 59, 54, 57, 47, 39, 49, 50, 59],
                symbol:'circle',
                symbolSize: 6,
                smooth: true,
                itemStyle: {
                    color: '#F3B8CC',
                    borderColor:'#E97CA0'
                },
                lineStyle:{
                    width:1,
                    color:'#E97CA0'
                }
            },{
                name: '第五医院',
                type: 'line',
                data: [43, 45, 46, 40, 49, 44, 47, 37, 49, 29, 30, 49],
                symbol:'circle',
                symbolSize: 6,
                smooth: true,
                itemStyle: {
                    color: '#F3C7B8',
                    borderColor:'#E9987C'
                },
                lineStyle:{
                    width:1,
                    color:'#E9987C'
                }
            },
        ]
    };
    myChart.setOption(option)
    return myChart
};

$(function () {
    var chartInit01 = chart01('chart01');
    var chartInit02 = chart02('chart02');
    var chartInit03 = chart03('chart03');
    var chartInit04 = chart04('chart04');
    var chartInit05 = chart05('chart05');
    var chartInit06 = chart06('chart06');

    var chartInitCf01 = chart01('chartCf01');
    var chartInitCf02 = chart02('chartCf02');
    var chartInitCf03 = chart03('chartCf03');
    var chartInitCf04 = chart04('chartCf04');
    var chartInitCf05 = chart05('chartCf05');
    var chartInitCf06 = chart06('chartCf06');

    
    $(".modeTop .title .tabTop span").click(function () {
        $(this).addClass("active").siblings("span").removeClass("active");
        $(this).parents(".mode").find(".modeCon").eq($(this).index()).show().siblings(".modeCon").hide();
        chartInit01.resize();
        chartInit02.resize();
        chartInit03.resize();
        chartInit04.resize();
        chartInit05.resize();
        chartInit06.resize();

        chartInitCf01.resize();
        chartInitCf02.resize();
        chartInitCf03.resize();
        chartInitCf04.resize();
        chartInitCf05.resize();
        chartInitCf06.resize();
    });

    $(window).resize(function () {
        chartInit01.resize();
        chartInit02.resize();
        chartInit03.resize();
        chartInit04.resize();
        chartInit05.resize();
        chartInit06.resize();

        chartInitCf01.resize();
        chartInitCf02.resize();
        chartInitCf03.resize();
        chartInitCf04.resize();
        chartInitCf05.resize();
        chartInitCf06.resize();
    });

});
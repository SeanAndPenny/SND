
function chart01(id) {
    var myChart = echarts.init(document.getElementById(id));
    var option = {
        tooltip: {
            trigger: 'axis',
            axisPointer: {
                type: 'shadow'
            }
        },
        legend: {
            itemWidth: 12,
            itemHeight: 12,
            itemGap: 20,
            orient: 'vertical',
            data: ['户籍人口', '流动人口'],
            bottom: '20%',
            right: '8%',
            textStyle: {
                fontSize: 15
            }
        },
        series: [
            {
                name: '户籍人口/流动人口占比',
                type: 'pie',
                hoverOffset: 6,
                center: ["43%", "49%"],
                radius: ['35%', '60%'],
                label: {
                    show: false
                },
                labelLine: {
                    show: false,
                    length: 11,
                    length2: 12
                },
                data: [
                    {
                        value: 10,
                        name: '户籍人口',
                        itemStyle: {
                            color: '#88CA6D'
                        },
                    },
                    {
                        value: 17,
                        name: '流动人口',
                        itemStyle: {
                            color: '#0DAEF1'
                        },
                    }
                ],
                emphasis: {
                    label: {
                        show: true,
                        fontSize: 18,
                        formatter: function (params) {
                            return '{a|' + params.name + '}\n' + (params.percent).toFixed(2) + '%'
                        },
                        rich: {
                            a: {
                                fontSize: 15,
                                color: '#333333',
                                padding: [6, 0, 0, 0]
                            }
                        }
                    },
                    labelLine: {
                        show: true,
                        lineStyle: {
                            color: '#000'
                        }
                    }
                }
            }
        ]
    };
    myChart.setOption(option)
    return myChart
};

function chart02(id) {
    var myChart = echarts.init(document.getElementById(id));
    var fontColor = '#333';
    var chartData = [
        { name: '通安镇', value: 30 },
        { name: '东渚街道', value: 40 },
        { name: '阳山街道', value: 45 },
        { name: '横塘街道', value: 18 },
        { name: '狮山街道', value: 65 },
        { name: '浒墅关镇', value: 25 },
        { name: '镇湖街道', value: 26 },
        { name: '枫桥街道', value: 56 }
    ];

    var xData = [];
    var sData = [];

    $.each(chartData, function (index, item) {
        xData.push(item.name);
        sData.push(item.value)
    });

    var lineOption = {
        lineStyle: {
            color: 'rgba(51,51,51,.75)',
            type: 'solid'
        }
    };
    var option = {
        tooltip: {
            trigger: 'axis',
            axisPointer: {
                type: 'shadow'
            }
        },
        legend: {
            itemHeight: 12,
            itemWidth: 12,
            right: '4%',
            top: "4%",
            itemGap: 15,
            textStyle: {
                color: "#333333",
                fontSize: 12
            },
            data: [
                {
                    name: "流动人口",
                },
                {
                    name: "户籍人口",
                }
            ]
        },
        grid: {
            containLabel: true,
            top: '17%',
            right: '4%',
            left: '4%',
            bottom: '6%'
        },
        yAxis: [{
            name: '万人',
            nameGap: 13,
            nameTextStyle: {
                color: fontColor,
                fontSize: 12
            },
            axisLabel: {
                formatter: '{value}',
                color: fontColor,
                textStyle: {
                    fontSize: 12
                }
            },
            axisTick: {
                show: false
            },
            axisLine: lineOption,
            splitLine: {
                show: true,
                lineStyle: {
                    color: '#ededed'
                }
            }
        }],
        xAxis: [{
            type: 'category',
            data: xData,
            axisLine: lineOption,
            boundaryGap: true,
            axisTick: {
                show: false
            },
            axisLabel: {
                margin: 10,
                color: fontColor,
                textStyle: {
                    fontSize: 12
                }
            },
            splitLine: {
                show: true,
                lineStyle: {
                    color: '#ededed'
                }
            },
            splitArea: {
                show: false
            }
        }],
        series: [
            {
                name: '户籍人口',
                type: 'bar',
                barWidth: 16,
                data: sData,
                stack: true,
                itemStyle: {
                    color: '#1572D5'
                }
            }, {
                name: '流动人口',
                type: 'bar',
                barWidth: 16,
                data: [33, 23, 43, 60, 45, 50, 67, 45],
                stack: true,
                itemStyle: {
                    color: '#0DAEF1'
                }
            },
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
                type: 'shadow'
            }
        },
        series: [
            {
                name: '年龄段占比及分布分析',
                type: 'pie',
                hoverOffset: 6,
                center: ["47%", "40%"],
                radius: ['35%', '60%'],
                label: {
                    show: false
                },
                labelLine: {
                    show: false,
                    length: 6,
                    length2: 8,
                },
                data: [
                    {
                        value: 10,
                        name: '婴儿期',
                        itemStyle: {
                            color: '#88CA6D'
                        },
                    },
                    {
                        value: 19,
                        name: '幼儿期',
                        itemStyle: {
                            color: '#3AA873'
                        },
                    },
                    {
                        value: 14,
                        name: '学龄前期',
                        itemStyle: {
                            color: '#2EEDE6'
                        },
                    },
                    {
                        value: 15,
                        name: '学龄期',
                        itemStyle: {
                            color: '#2DC6F2'
                        },
                    },
                    {
                        value: 24,
                        name: '青春期',
                        itemStyle: {
                            color: '#0DAEF1'
                        },
                    },
                    {
                        value: 45,
                        name: '青年期',
                        itemStyle: {
                            color: '#1572D5'
                        },
                    },
                    {
                        value: 34,
                        name: '中年期',
                        itemStyle: {
                            color: '#744EBC'
                        },
                    },
                    {
                        value: 25,
                        name: '老年期',
                        itemStyle: {
                            color: '#5D6DBD'
                        },
                    }
                ],
                emphasis: {
                    label: {
                        show: true,
                        fontSize: 18,
                        formatter: function (params) {
                            return '{a|' + params.name + '}\n' + (params.percent).toFixed(2) + '%'
                        },
                        rich: {
                            a: {
                                fontSize: 15,
                                color: '#343434',
                                padding: [6, 0, 0, 0]
                            }
                        }
                    },
                    labelLine: {
                        show: true,
                        lineStyle: {
                            color: '#000'
                        }
                    }
                }
            }
        ]
    };
    myChart.setOption(option)
    return myChart
};

function chart04(id) {
    var myChart = echarts.init(document.getElementById(id));
    var max = [8000, 8000, 8000, 8000, 8000, 8000, 8000, 8000]
    var option = {
        tooltip: {
            trigger: 'axis',
            axisPointer: {
                type: 'shadow'
            }
        },
        grid: {
            containLabel: true,
            top: '12%',
            right: '9%',
            left: -46,
            bottom: '4%'
        },
        legend: {
            itemWidth: 12,
            itemHeight: 12,
            data: ['学龄期人口数'],
            top: '4%',
            right: '8%'
        },
        yAxis: [
            {
                type: "category",
                axisLabel: {
                    color: '#333333',
                    interval: 0,
                    margin: 57,
                    align: 'left',
                    textStyle: {
                        fontSize: 12
                    }
                },
                axisTick: {
                    show: false
                },
                axisLine: {
                    show: true,
                    lineStyle: {
                        color: '#D6D6D6',
                    }
                },
                data: ['通安镇', '东渚街道', '阳山街道', '横塘街道', '狮山街道', '浒墅关镇', '镇湖街道', '枫桥街道'].reverse(),
                splitArea: {
                    show: false
                },
            }],
        xAxis: [{
            type: 'value',
            name: "万",
            nameGap: 7,
            nameTextStyle: {
                color: '#646464',
                fontSize: 14
            },
            axisLine: {
                show: true,
                lineStyle: {
                    color: '#D6D6D6',
                }
            },
            axisTick: {
                show: false
            },
            axisLabel: {
                margin: 10,
                color: '#000000',
                textStyle: {
                    fontSize: 13
                },
                formatter: function (params) {
                    return (params / 1000).toFixed(0)
                }
            },
            splitLine: {
                show: false
            },
        }],
        series: [
            {
                name: '学龄期人口数',
                type: 'bar',
                data: [6384, 5980, 5865, 4340, 2238, 3148, 2756, 3234].reverse(),
                barWidth: 13,
                itemStyle: {
                    color: '#2DC6F2'
                },
                label: {
                    show: false,
                }
            },
            {
                name: '',
                type: 'bar',
                data: max,
                barWidth: 14,
                barGap: '-100%',
                itemStyle: {
                    color: 'rgba(153,123,230,.1)'
                },
                tooltip: {
                    show: false
                }
            },
        ]
    };
    myChart.setOption(option)
    return myChart
};

function chart05(id) {
    var myChart = echarts.init(document.getElementById(id));
    var fontColor = '#333';
    var chartData = [
        { name: '0岁', value: 3000 },
        { name: '3岁', value: 4000 },
        { name: '6岁', value: 4500 },
        { name: '9岁', value: 1800 },
        { name: '12岁', value: 6500 },
        { name: '15岁', value: 2500 },
        { name: '18岁', value: 2600 },
        { name: '21岁', value: 5600 },
        { name: '24岁', value: 3000 },
        { name: '27岁', value: 2300 },
        { name: '30岁', value: 4305 },
        { name: '33岁', value: 1300 },
        { name: '36岁', value: 3000 },
        { name: '39岁', value: 3000 },
        { name: '42岁', value: 5000 },
        { name: '45岁', value: 3000 },
        { name: '48岁', value: 5300 },
        { name: '51岁', value: 2300 },
        { name: '54岁', value: 3500 },
        { name: '57岁', value: 3700 },
        { name: '61岁', value: 3800 },
        { name: '64岁', value: 4300 },
        { name: '67岁', value: 2300 },
        { name: '70岁', value: 3700 },
        { name: '81岁', value: 3900 }
    ];

    var xData = [];
    var sData = [];

    $.each(chartData, function (index, item) {
        xData.push(item.name);
        sData.push(item.value)
    });

    var lineOption = {
        lineStyle: {
            color: 'rgba(219,225,229,.75)',
            type: 'solid'
        }
    };
    var option = {
        tooltip: {
            trigger: 'axis',
            axisPointer: {
                type: 'line',
                label: {
                    fontSize: 12
                }
            },
            formatter: function (params) {
                return '人口年龄：' + params[0].axisValue + '<br/>' + params[0].seriesName + '：' + params[0].data + '人<br/>' + params[1].seriesName + '：' + params[1].data + '人'
            },
            backgroundColor: 'rgba(46, 113, 146, .6)'
        },
        legend: {
            itemHeight: 8,
            itemWidth: 14,
            right: '4%',
            top: "4%",
            itemGap: 20,
            textStyle: {
                color: "#343434",
                fontSize: 13
            },
            data: [
                {
                    name: "流动人口",
                },
                {
                    name: "户籍人口",
                }
            ]
        },
        grid: {
            containLabel: true,
            top: '17%',
            right: '4%',
            left: '4%',
            bottom: '5%'
        },
        yAxis: [{
            name: '千人',
            nameGap: 10,
            nameTextStyle: {
                color: fontColor,
                fontSize: 12
            },
            axisLabel: {
                color: fontColor,
                fontSize: 12,
                formatter: function (params) {
                    return (params / 1000).toFixed(0)
                }
            },
            axisTick: {
                show: false
            },
            axisLine: lineOption,
            splitLine: {
                show: true,
                lineOption
            }
        }],
        xAxis: [{
            type: 'category',
            data: xData,
            axisLine: lineOption,
            boundaryGap: false,
            axisTick: {
                show: false
            },
            axisLabel: {
                margin: 10,
                color: fontColor,
                textStyle: {
                    fontSize: 12
                }
            },
            splitArea: {
                show: true,
                areaStyle: {
                    color: ['rgba(255,255,255,.01)', 'rgba(237,240,246,.5)']
                }
            }
        }],
        series: [
            {
                name: '流动人口',
                type: 'line',
                data: sData,
                symbolSize: 8,
                smooth: true,
                zlevel: 2,
                itemStyle: {
                    color: 'rgba(6,189,101,1)'
                },
                areaStyle: {
                    color: 'rgba(6,189,101,.3)'
                }
            }, {
                name: '户籍人口',
                type: 'line',
                data: [3300, 2300, 4300, 6000, 4500, 5000, 6700, 4500, 3300, 5100, 2300, 4400, 1500, 5000, 2000, 3400, 3300, 7800, 6700, 5600, 2200, 2200, 2200, 2200, 4220],
                symbolSize: 8,
                smooth: true,
                zlevel: 2,
                itemStyle: {
                    color: 'rgba(97,168,255,1)'
                },
                areaStyle: {
                    color: 'rgba(97,168,255,.3)'
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

    $(window).resize(function () {
        chartInit01.resize();
        chartInit02.resize();
        chartInit03.resize();
        chartInit04.resize();
        chartInit05.resize();
    });

});
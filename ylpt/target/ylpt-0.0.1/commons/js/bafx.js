
function chart01(id) {
    var myChart = echarts.init(document.getElementById(id));
    var fontColor = '#333';
    var chartData = [
        { name: '科技城医院', value: 3000 },
        { name: '高新区医院', value: 4000 },
        { name: '明基医院', value: 4500 },
        { name: '苏大附一', value: 1800 },
        { name: '苏大附二', value: 6500 },
        { name: '中医院', value: 12500 },
        { name: '九龙医院', value: 1260 }
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
            trigger: 'none',
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
                    name: "病案人数",
                }
            ]
        },
        grid: {
            containLabel: true,
            top: '17%',
            right: '4%',
            left: '3%',
            bottom: '6%'
        },
        yAxis: [{
            name: '人',
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
                interval:0,
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
                name: '病案人数',
                type: 'bar',
                barWidth: 24,
                data: sData,
                itemStyle: {
                    color: '#2C87E9'
                },
                label: {
                    show: false,
                    position: 'top',
                    formatter: function (params) {
                        return '{a|' + params.value + '人}\n' + '{b|}'
                    },
                    rich: {
                        a: {
                            backgroundColor: 'rgba(21, 114, 213, .6)',
                            padding: [3, 6, 6, 6],
                            borderRadius: 2,
                            color: '#FFFFFF',
                            fontSize:12
                        },
                        b: {
                            width: 5,
                            height: 5,
                            align: 'center',
                            backgroundColor: { image: '../images/small-bg01.png' }
                        }
                    }
                },
                emphasis: {
                    label: {
                        show: true,
                    }
                },
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
        { name: '科技城医院', value: 10500 },
        { name: '横塘街道社区卫生服务中心', value: 12600 }
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
            trigger: 'none',
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
                    name: "病案人数",
                }
            ]
        },
        grid: {
            containLabel: true,
            top: '17%',
            right: '4%',
            left: '3%',
            bottom: '6%'
        },
        yAxis: [{
            name: '人',
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
                name: '病案人数',
                type: 'bar',
                barWidth: 24,
                data: sData,
                itemStyle: {
                    color: '#88CA6D'
                },
                label: {
                    show: false,
                    position: 'top',
                    formatter: function (params) {
                        return '{a|' + params.value + '人}\n' + '{b|}'
                    },
                    rich: {
                        a: {
                            backgroundColor: 'rgba(102, 166, 76, .6)',
                            padding: [3, 6, 6, 6],
                            borderRadius: 2,
                            color: '#FFFFFF',
                            fontSize:12
                        },
                        b: {
                            width: 5,
                            height: 5,
                            align: 'center',
                            backgroundColor: { image: 'images/bafx/small-bg02.png' }
                        }
                    }
                },
                emphasis: {
                    label: {
                        show: true,
                    }
                },
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
            trigger: 'item',
            axisPointer: {
                type: 'shadow'
            },
            formatter:function(params){
                return params.name+"："+params.percent+'%'
            }
        },
        series: [
            {
                name: '病案疾病大类分析',
                type: 'pie',
                hoverOffset: 6,
                center: ["40%", "47%"],
                radius: ['45%', '76%'],
                label: {
                    show: false
                },
                data: [
                    {
                        value: 80960,
                        name: '肌肉骨骼系统和结缔组织疾病',
                        itemStyle: {
                            color: '#7EB24A'
                        },
                    },
                    {
                        value: 80960,
                        name: '症状、体征和临床与实验室异常所见，不可归类在他处者',
                        itemStyle: {
                            color: '#1CACC0'
                        },
                    },
                    {
                        value: 80960,
                        name: '耳和乳突疾病',
                        itemStyle: {
                            color: '#188AD0'
                        },
                    },
                    {
                        value: 90960,
                        name: '妊辰、分娩和产褥期',
                        itemStyle: {
                            color: '#68B6F4'
                        },
                    },
                    {
                        value: 89960,
                        name: '肿瘤',
                        itemStyle: {
                            color: '#5892F3'
                        },
                    },
                    {
                        value: 80960,
                        name: '精神和行为障碍',
                        itemStyle: {
                            color: '#3650D0'
                        },
                    },
                    {
                        value: 80960,
                        name: '眼和附器疾病',
                        itemStyle: {
                            color: '#4062FF'
                        },
                    },
                    {
                        value: 80960,
                        name: '消化系统疾病',
                        itemStyle: {
                            color: '#8C6CF3'
                        },
                    },
                    {
                        value: 50960,
                        name: '内分泌、营养和代谢疾病',
                        itemStyle: {
                            color: '#5056A4'
                        },
                    },
                    {
                        value: 80960,
                        name: '神经系统疾病',
                        itemStyle: {
                            color: '#6872E0'
                        },
                    },
                    {
                        value: 80960,
                        name: '呼吸系统疾病',
                        itemStyle: {
                            color: '#34CAEF'
                        },
                    },
                    {
                        value: 80960,
                        name: '起源于围生期的某些情况',
                        itemStyle: {
                            color: '#2EACA2'
                        },
                    },
                    {
                        value: 80960,
                        name: '泌尿生殖系统疾病',
                        itemStyle: {
                            color: '#44CA94'
                        },
                    },
                    {
                        value: 80960,
                        name: '损伤、中毒和外因的某些疾病',
                        itemStyle: {
                            color: '#32B03E'
                        },
                    },
                    {
                        value: 80960,
                        name: '血液及造血器官疾病',
                        itemStyle: {
                            color: '#9EDE5C'
                        },
                    },
                    {
                        value: 80960,
                        name: '循环系统疾病',
                        itemStyle: {
                            color: '#CCF04D'
                        },
                    },
                    {
                        value: 80960,
                        name: '某些传染病和寄生虫病',
                        itemStyle: {
                            color: '#D9DB1B'
                        },
                    },
                    {
                        value: 80960,
                        name: '皮肤和皮下组织疾病',
                        itemStyle: {
                            color: '#DC9023'
                        },
                    }
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
    myChart.on('click', function (params) { 
        $(".mode04 .modeTop .title label").html(params.name)
    });
    return myChart
};

function chart04(id) {
    var myChart = echarts.init(document.getElementById(id));
    var max = [600, 600, 600, 600, 600, 600, 600]
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
            left: -30,
            bottom: '13%'
        },
        legend: {
            itemWidth: 12,
            itemHeight: 12,
            data: ['人数'],
            top: '0',
            right: '8%'
        },
        yAxis: [
            {
                type: "category",
                axisLabel: {
                    color: '#333333',
                    interval: 0,
                    margin: 68,
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
                        color: 'rgba(51,51,51,.75)',
                    }
                },
                data: ['肺癌', '肝癌', '肠癌', '甲状腺癌症', '皮肤癌', '直肠癌', '前列腺癌'].reverse(),
                splitArea: {
                    show: false
                },
            }],
        xAxis: [{
            type: 'value',
            name: "人",
            nameGap: 7,
            nameTextStyle: {
                color: '#646464',
                fontSize: 14
            },
            axisLine: {
                show: false
            },
            axisTick: {
                show: false
            },
            axisLabel: {
                margin: 10,
                color: '#000000',
                textStyle: {
                    fontSize: 12
                }
            },
            splitLine: {
                show: true,
                lineStyle:{
                  type:"dashed",
                  color:"#D6D6D6"
                }          
            },
        }],
        series: [
            {
                name: '人数',
                type: 'bar',
                data: [384, 480, 465, 340, 238, 148, 300].reverse(),
                barWidth: 14,
                itemStyle: {
                  color: '#30AAFF'
                },
                label: {
                    show: true,
                    position:'right',
                    color:'#333',
                    formatter:function(params){
                        return params.value+'人'
                    }
                }
            },
            {
                name: '',
                type: 'bar',
                data: max,
                barWidth: 14,
                barGap: '-100%',
                itemStyle: {
                    color: 'rgba(90, 184, 235, .1)'
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


$(function () {
    var chartInit01 = chart01('chart01');
    var chartInit02 = chart02('chart02');
    var chartInit03 = chart03('chart03');
    var chartInit04 = chart04('chart04');
    var chartInit05 = chart04('chart05');
    var chartInit06 = chart04('chart06');
    var chartInit07 = chart04('chart07');
    var chartInit08 = chart04('chart08');

    $(window).resize(function () {
        chartInit01.resize();
        chartInit02.resize();
        chartInit03.resize();
        chartInit04.resize();
        chartInit05.resize();
        chartInit06.resize();
        chartInit07.resize();
        chartInit08.resize();
    });

});
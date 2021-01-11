
function chart01(id) {
    var myChart = echarts.init(document.getElementById(id));
    var fontColor = '#333';
    var chartData = [
        { name: '2014年', value: 3000 },
        { name: '2015年', value: 4000 },
        { name: '2016年', value: 4500 },
        { name: '2017年', value: 1800 },
        { name: '2018年', value: 6500 },
        { name: '2019年', value: 1259 },
        { name: '2020年', value: 1200 }
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
                    name: "死亡人数",
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
            name: '百人',
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
                },
                formatter: function (value) {
                    return Math.ceil(value / 100)
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
                interval: 0,
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
                name: '死亡人数',
                type: 'bar',
                barWidth: 24,
                data: sData,
                itemStyle: {
                    color: '#1572D5'
                },
                label: {
                    show: false,
                    position: 'top',
                    formatter: function (params) {
                        return '{a|' + params.name + '  死亡：' + params.value + '人}\n' + '{b|}'
                    },
                    rich: {
                        a: {
                            backgroundColor: 'rgba(21, 114, 213, .6)',
                            padding: [3, 6, 6, 6],
                            borderRadius: 2,
                            color: '#FFFFFF',
                            fontSize: 12
                        },
                        b: {
                            width: 5,
                            height: 5,
                            align: 'center',
                            backgroundColor: { image: 'images/bafx/small-bg01.png' }
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
    var option = {
        tooltip: {
            trigger: 'axis',
            axisPointer: {
                type: 'shadow'
            }
        },
        series: [
            {
                name: '死亡年龄段分布',
                type: 'pie',
                hoverOffset: 4,
                center: ["26%", "54%"],
                radius: ['35%', '60%'],
                label: {
                    show: false
                },
                labelLine: {
                    show: false,
                    length: 8,
                    length2: 5
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
                        value: 17,
                        name: '幼儿期',
                        itemStyle: {
                            color: '#3AA873'
                        },
                    },
                    {
                        value: 17,
                        name: '学龄前期',
                        itemStyle: {
                            color: '#2EEDE6'
                        },
                    },
                    {
                        value: 17,
                        name: '学龄期',
                        itemStyle: {
                            color: '#F9A92B'
                        },
                    },
                    {
                        value: 17,
                        name: '青春期',
                        itemStyle: {
                            color: '#0DAEF1'
                        },
                    },
                    {
                        value: 17,
                        name: '青年期',
                        itemStyle: {
                            color: '#1572D5'
                        },
                    },
                    {
                        value: 17,
                        name: '中年期',
                        itemStyle: {
                            color: '#744EBC'
                        },
                    },
                    {
                        value: 600,
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
                            return '{a|' + params.name + '}\n' + (params.percent).toFixed(2) + '%\n' +params.value+'人'
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

function chart03(id) {
    var myChart = echarts.init(document.getElementById(id));
    var option = {
        tooltip: {
            trigger: 'axis',
            axisPointer: {
                type: 'shadow',
            },
            backgroundColor:'rgba(69, 69, 222, .6)'
        },
        grid: {
            containLabel: true,
            top: '13%',
            right: '5%',
            left: '4%',
            bottom: '6%'
        },
        yAxis: [{
            name: '百人',
            nameGap: 10,
            nameTextStyle: {
                color: '#333333',
                fontSize: 12
            },
            axisLabel: {
                color: '#333333',
                fontSize: 12,
                formatter: function (value) {
                    return Math.ceil(value / 100)
                }
            },
            axisTick: {
                show: false
            },
            axisLine: {
                lineStyle: {
                    color: 'rgba(219, 225, 229, .75)'
                }
            },
            splitLine: {
                show: true,
                lineStyle: {
                    color: 'rgba(219, 225, 229, .75)'
                }
            }
        }],
        xAxis: [{
            type: 'category',
            data: ['2014年', '2015年', '2016年', '2017年', '2018年', '2019年', '2020年'],
            axisLine: {
                lineStyle: {
                    color: 'rgba(219, 225, 229, .75)'
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
                name: '婴儿期',
                type: 'line',
                data: [3300, 4400, 4000, 3200, 5000, 1200, 5500],
                symbol: 'circle',
                symbolSize: 6,
                smooth: true,
                itemStyle: {
                    color: 'white',
                    borderColor: '#0cbe68'
                },
                lineStyle: {
                    width: 1,
                    color:'#0cbe68'
                }
            }, {
                name: '幼儿期',
                type: 'line',
                data: [3300, 230, 430, 6000, 4500, 500, 670, 4500, 3300, 510, 2300, 4400],
                symbol: 'circle',
                symbolSize: 6,
                smooth: true,
                itemStyle: {
                    color: 'white',
                    borderColor: '#0cbe68'
                },
                lineStyle: {
                    width: 1,
                    color: '#0cbe68'
                }
            }, {
                name: '学龄前期',
                type: 'line',
                data: [2300, 4300, 3300, 5000, 3500, 3400, 600, 4000, 307, 5008, 2800, 4800],
                symbol: 'circle',
                symbolSize: 6,
                smooth: true,
                itemStyle: {
                    color: 'white',
                    borderColor: '#2eede6'
                },
                lineStyle: {
                    width: 1,
                    color: '#2eede6'
                }
            }, {
                name: '学龄期',
                type: 'line',
                data: [530, 2300, 3700, 400, 4500, 2400, 5000, 4500, 4700, 480, 3800, 490],
                symbol: 'circle',
                symbolSize: 6,
                smooth: true,
                itemStyle: {
                    color: 'white',
                    borderColor: '#f9a92b'
                },
                lineStyle: {
                    width: 1,
                    color: '#f9a92b'
                }
            }, {
                name: '青春期',
                type: 'line',
                data: [570, 2500, 3900, 3000, 3500, 5400, 4000, 3500, 4100, 3800, 300, 3900],
                symbol: 'circle',
                symbolSize: 6,
                smooth: true,
                itemStyle: {
                    color: 'white',
                    borderColor: '#0daef1'
                },
                lineStyle: {
                    width: 1,
                    color: '#0daef1'
                }
            }, {
                name: '青年期',
                type: 'line',
                data: [5300, 2900, 4900, 2000, 1500, 6400, 2000, 1500, 2100, 480, 2000, 1900],
                symbol: 'circle',
                symbolSize: 6,
                smooth: true,
                itemStyle: {
                    color: 'white',
                    borderColor: '#1572d5'
                },
                lineStyle: {
                    width: 1,
                    color: '#1572d5'
                }
            }, {
                name: '中年期',
                type: 'line',
                data: [4300, 3900, 4600, 3000, 1900, 5400, 2700, 1700, 2900, 4900, 4000, 2900],
                symbol: 'circle',
                symbolSize: 6,
                smooth: true,
                itemStyle: {
                    color: 'white',
                    borderColor: '#744ebc'
                },
                lineStyle: {
                    width: 1,
                    color: '#744ebc'
                }
            }, {
                name: '老年期',
                type: 'line',
                data: [5300, 2900, 3600, 2000, 3900, 2400, 3700, 3700, 3900, 3900, 2000, 1900],
                symbol: 'circle',
                symbolSize: 6,
                smooth: true,
                itemStyle: {
                    color: 'white',
                    borderColor: '#6877c1'
                },
                lineStyle: {
                    width: 1,
                    color: '#6877c1'
                }
            }
        ]
    };
    myChart.setOption(option)
    return myChart
};

function chart04(id) {
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
                        name: '呼吸系统疾病',
                        itemStyle: {
                            color: '#7EB14A'
                        },
                    },
                    {
                        value: 80960,
                        name: '泌尿生殖系统疾病',
                        itemStyle: {
                            color: '#1BACBF'
                        },
                    },
                    {
                        value: 80960,
                        name: '症状、体征和临床与实验室异常所见，不可归类在他处者',
                        itemStyle: {
                            color: '#178ACF'
                        },
                    },
                    {
                        value: 90960,
                        name: '血液及造血器官疾病和某些涉及免疫机制的疾患',
                        itemStyle: {
                            color: '#68B6F4'
                        },
                    },
                    {
                        value: 89960,
                        name: '肿瘤',
                        itemStyle: {
                            color: '#5792F3'
                        },
                    },
                    {
                        value: 80960,
                        name: '先天性畸形，变形和染色体异常',
                        itemStyle: {
                            color: '#5D6DBD'
                        },
                    },
                    {
                        value: 80960,
                        name: '皮肤和皮下组织疾病',
                        itemStyle: {
                            color: '#9477CA'
                        },
                    },
                    {
                        value: 80960,
                        name: '消化系统疾病',
                        itemStyle: {
                            color: '#744EBC'
                        },
                    },
                    {
                        value: 50960,
                        name: '神经系统疾病',
                        itemStyle: {
                            color: '#B96BC6'
                        },
                    },
                    {
                        value: 80960,
                        name: '起源于围生期的某些情况',
                        itemStyle: {
                            color: '#F59ADC'
                        },
                    },
                    {
                        value: 80960,
                        name: '某些传染病和寄生虫病',
                        itemStyle: {
                            color: '#EC7FC4'
                        },
                    },
                    {
                        value: 80960,
                        name: '精神和行为障碍',
                        itemStyle: {
                            color: '#A94CBA'
                        },
                    },
                    {
                        value: 80960,
                        name: '疾病和死亡外因',
                        itemStyle: {
                            color: '#BA4CAC'
                        },
                    },
                    {
                        value: 80960,
                        name: '肌肉骨骼系统和结缔组织疾病',
                        itemStyle: {
                            color: '#9DDE5B'
                        },
                    },
                    {
                        value: 80960,
                        name: '循环系统疾病',
                        itemStyle: {
                            color: '#CBF04C'
                        },
                    },
                    {
                        value: 80960,
                        name: '内分泌、营养和代谢疾病',
                        itemStyle: {
                            color: '#D9DB1B'
                        },
                    },
                    {
                        value: 80960,
                        name: '损伤、中毒和外因的某些其他后果',
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
    return myChart
};


$(function () {
    var chartInit01 = chart01('chart01');
    var chartInit02 = chart02('chart02');
    var chartInit03 = chart03('chart03');
    var chartInit04 = chart04('chart04');

    var chartInitCf01 = chart01('chartCf01');


    $(".modeTop .title .tabTop span").click(function () {
        $(this).addClass("active").siblings("span").removeClass("active");
        $(this).parents(".mode").find(".modeCon").eq($(this).index()).show().siblings(".modeCon").hide();
        chartInit01.resize();
        chartInit02.resize();
        chartInit03.resize();
        chartInit04.resize();

        chartInitCf01.resize();
    });
    function gl(el) {
        //默认其中一个高亮
        el.dispatchAction({
            type: 'highlight',
            dataIndex: 0,
        });

        //离开其中一个模块高亮取消，默认第一块高亮
        el.on("mouseout", function (params) {
            el.dispatchAction({
                type: 'downplay',
                dataIndex: params.dataIndex,
            });
            el.dispatchAction({
                type: 'highlight',
                dataIndex: 0,
            });
        });
        //鼠标移入此模块高亮，之前的模块高亮取消
        el.on("mouseover", function (params) {
            el.dispatchAction({
                type: 'highlight',
                dataIndex: params.dataIndex,
            });
            el.dispatchAction({
                type: 'downplay',
                dataIndex: params.dataIndex == 0 ? 1 : 0,
            });
        });
    };

    gl(chartInit02);
    
    $(window).resize(function () {
        chartInit01.resize();
        chartInit02.resize();
        chartInit03.resize();
        chartInit04.resize();

        chartInitCf01.resize();
    });

});
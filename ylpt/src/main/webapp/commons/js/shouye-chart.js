
function chart01(id) {
    var myChart = echarts.init(document.getElementById(id));
    option = {
        tooltip: {
            trigger: 'item',
            formatter: "{a} <br/>{b}: {c} ({d}%)"
        },
        series: [
            {
                name: '医疗机构占比分布',
                type: 'pie',
                radius: ['5%', '42%'],
                center: ['50%', '46%'],
                avoidLabelOverlap: true,
                hoverOffset:5,
                itemStyle: {
                    borderColor: '#fff',
                    borderWidth: 2,
                },
                label: {
                    show: true,
                    position: 'inside',
                    color: "#fff",
                    fontSize: 13,
                },
                data: [
                    {
                        name: "政府办",
                        value: 45,
                        itemStyle: {
                            color: "#76caf4"
                        }
                    },
                    {
                        name: "社会办",
                        value: 55,
                        itemStyle: {
                            color: "#00adf4"
                        }
                    },
                ]
            },
            {
                name: '医疗机构占比分布',
                type: 'pie',
                radius: ['50%', '63%'],
                center: ['50%', '46%'],
                avoidLabelOverlap: true,
                hoverOffset:5,
                itemStyle: {
                    borderColor: '#fff',
                    borderWidth: 2,
                },
                label: {
                    show: true,
                    fontSize: 13,
                    formatter: function (params) {
                        return " ● " + "{a|" + params.data.name + "，}" + "{b|占比：" + params.percent + "%}"
                    },
                    lineHeight: 18,
                    rich: {
                        a: {
                            color: "#333",
                            fontSize: 13
                        },
                        b: {
                            color: "#333333",
                            fontSize: 13
                        }
                    }
                },
                labelLine: {
                    show: true,
                    length: 22,
                    length2: 14,
                    lineStyle: {
                        // color: '#627da3',
                    }
                },
                data: [
                    {
                        name: "政府办社区卫生服务机构\n共48家",
                        value: 18,
                        itemStyle: {
                            color: "#57c5a2"
                        }
                    },

                    {
                        name: "政府办门诊部\n共4家",
                        value: 4,
                        itemStyle: {
                            color: "#86cb68"
                        }
                    },
                    {
                        name: "政府办内设机构\n共57家",
                        value: 18,
                        itemStyle: {
                            color: "#f7a932"
                        }
                    },
                    {
                        name: "社会办社区卫生服务机构\n共3家",
                        value: 8,
                        itemStyle: {
                            color: "#ee7a8d"
                        }
                    },
                    {
                        name: "社会办门诊部\n共13家",
                        value: 12,
                        itemStyle: {
                            color: "#9884f3"
                        }
                    },
                    {
                        name: "社会办诊所\n共51家",
                        value: 25,
                        itemStyle: {
                            color: "#6288d1"
                        }
                    },
                    {
                        name: "社会办内设机构\n共41家",
                        value: 15,
                        itemStyle: {
                            color: "#066fd8"
                        }
                    }
                ]
            }]
    };
    myChart.setOption(option);
    return myChart;
};
function chart02(id) {
    var myChart = echarts.init(document.getElementById(id));
    var option = {
        tooltip: {
            trigger: 'axis',
            padding: [5, 10],
            //backgroundColor: '#529bfb',
            axisPointer: {            // 坐标轴指示器，坐标轴触发有效
                type: 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
            }
        },
        grid: {
            left: 46,
            right: 37,
            top: 50,
            bottom: 45,
        },
        legend: {
            top: 10,
            right: 35,
            itemWidth: 15,
            itemHeight: 9,
            bottom: -5,
            data: [
                {
                    name: "初级职称",
                },
                {
                    name: "中级职称"
                },
                {
                    name: "高级职称"
                }
            ]
        },
        xAxis:
        {
            axisTick: {
                show: false
            },
            axisLine: {
                show: true,
                lineStyle: {
                    color: "#9fa6b2"
                }
            },
            splitLine: {
                show: false,
            },
            axisLabel: {
                fontSize: 12,
                color: '#333',
                interval: 0,
                margin: 14,
            },
            data: ['政府办在编人员', '政府办在籍人员'],
        },
        yAxis: [
            {
                type: 'value',
                interval: 200,
                min: 0,
                max: 1000,
                name: "人次",
                nameTextStyle: {
                    fontSize: 12,
                    color: '#333',
                },
                axisTick: {
                    show: false,
                },
                axisLine: {
                    show: true,
                    lineStyle: {
                        color: "#9fa6b2"
                    }
                },
                splitLine: {
                    show: true,
                    lineStyle: {
                        color: "#d3dae6"
                    }
                },
                splitArea: {
                    show: true,
                    color: ["#f6f8fb", "#fff"]
                },
                axisLabel: {
                    fontSize: 12,
                    color: '#333'
                },

            }
        ],
        series: [
            {
                name: '初级职称',
                type: 'bar',
                barWidth: 19,
                itemStyle: {
                    barBorderRadius: [2, 2, 2, 2],
                    color: '#86cb68'
                },
                data: [100, 400]
            },
            {
                name: '中级职称',
                type: 'bar',
                barWidth: 19,
                itemStyle: {
                    barBorderRadius: [2, 2, 2, 2],
                    color: '#00adf4'
                },
                data: [300, 600]
            },
            {
                name: '高级职称',
                type: 'bar',
                barWidth: 19,
                itemStyle: {
                    barBorderRadius: [2, 2, 2, 2],
                    color: '#066fd8'
                },
                data: [200, 500]
            },
        ]
    };

    myChart.setOption(option);
    return myChart;
};
function chart03(id) {
    var myChart = echarts.init(document.getElementById(id));
    option = {
        tooltip: {
            trigger: 'item',
            formatter: "{a} <br/>{b}: {c} ({d}%)"
        },
        series: [
            {
                name:"出生人数统计",
                type: 'pie',
                radius: ['38%', '50%'],
                center: ['50%', '50%'],
                avoidLabelOverlap: true,
                hoverOffset:5,
                itemStyle: {
                    borderColor: '#fff',
                    borderWidth: 2,
                },
                label: {
                    show: true,
                    fontSize: 13,
                    formatter: function (params) {
                        return " ● " + "{a|" + params.data.name + "}" + "\n " + "{b|" + params.percent + "%}"
                    },
                    lineHeight: 18,
                    rich: {
                        a: {
                            color: "#333",
                            fontSize: 13
                        },
                        b: {
                            color: "#333",
                            fontSize: 13
                        }
                    }
                },
                labelLine: {
                    show: true,
                    length: 10,
                    length2: 8
                },
                data: [
                    {
                        name: "机构1",
                        value: 12,
                        itemStyle: {
                            color: "#9684f2"
                        }
                    },

                    {
                        name: "机构2",
                        value: 4,
                        itemStyle: {
                            color: "#ee7a8d"
                        }
                    },
                    {
                        name: "机构3",
                        value: 12,
                        itemStyle: {
                            color: "#ffc231"
                        }
                    },
                    {
                        name: "机构4",
                        value: 12,
                        itemStyle: {
                            color: "#86cb68"
                        }
                    },
                    {
                        name: "机构5",
                        value: 12,
                        itemStyle: {
                            color: "#57c5a2"
                        }
                    }
                ]
            }]
    };
    myChart.setOption(option);
    return myChart;
};
function chart04(id) {
    var myChart = echarts.init(document.getElementById(id));
    option = {
        tooltip: {
            trigger: 'item',
            formatter: "{a} <br/>{b}: {c} ({d}%)"
        },
        legend: {
            bottom: 0,
            data: [{
                name: "基层医院",
                icon: "circle"
            },
            {
                name: "综合医院",
                icon: "circle"
            }]
        },
        series: [
            {
                name:"床位统计",
                type: 'pie',
                radius: ['29%', '42%'],
                center: ['50%', '50%'],
                avoidLabelOverlap: true,
                hoverOffset:5,
                startAngle: 200,
                itemStyle: {
                    borderColor: '#fff',
                    borderWidth: 2,
                },
                label: {
                    show: true,
                    color: "#627da3",
                    fontSize: 13,
                    formatter: function (params) {
                        return "{a|" + params.data.name + "\n" + "共" + params.data.value + "条}" + "\n" + "{b|占比：" + params.percent + "%}"
                    },
                    lineHeight: 18,
                    rich: {
                        a: {
                            color: "#333",
                            fontSize: 12
                        },
                        b: {
                            color: "#333333",
                            fontSize: 13
                        }
                    }
                },
                labelLine: {
                    show: true,
                    length: 10,
                    length2: 5
                },
                data: [
                    {
                        name: "基层医院",
                        value: 12,
                        itemStyle: {
                            color: "#57c5a2"
                        }
                    },
                    {
                        name: "综合医院",
                        value: 28,
                        itemStyle: {
                            color: "#00adf4"
                        }
                    }

                ]
            }]
    };
    myChart.setOption(option);
    return myChart;
};
function chart05(id) {
    var myChart = echarts.init(document.getElementById(id));
    option = {
        tooltip: {
            trigger: 'item',
            formatter: "{a} <br/>{b}: {c} ({d}%)"
        },
        series: [
            {
                name:"签约机构占比",
                type: 'pie',
                radius: ['45%', '62%'],
                center: ['50%', '47%'],
                avoidLabelOverlap: true,
                hoverOffset:5,
                itemStyle: {
                    borderColor: '#fff',
                    borderWidth: 2,
                },
                label: {
                    show: true,
                    fontSize: 13,
                    formatter: function (params) {
                        return " ● " + "{a|" + params.data.name + "\n " + "签约" + params.data.value + "人," + "}" + "{b|占比：" + params.percent + "%}"
                    },
                    lineHeight: 18,
                    rich: {
                        a: {
                            color: "#333",
                            fontSize: 13
                        },
                        b: {
                            color: "#333",
                            fontSize: 13
                        }
                    }
                },
                labelLine: {
                    show: true,
                    length: 5,
                    length2: 5,
                    lineStyle: {
                        color: '#627da3',
                    }
                },
                data: [
                    {
                        name: "机构4",
                        value: 12,
                        itemStyle: {
                            color: "#9684f2"
                        }
                    },

                    {
                        name: "机构5",
                        value: 4,
                        itemStyle: {
                            color: "#6288d1"
                        }
                    },
                    {
                        name: "机构6",
                        value: 12,
                        itemStyle: {
                            color: "#066fd8"
                        }
                    },
                    {
                        name: "机构7",
                        value: 12,
                        itemStyle: {
                            color: "#00adf4"
                        }
                    },
                    {
                        name: "机构3",
                        value: 12,
                        itemStyle: {
                            color: "#76caf4"
                        }
                    },
                    {
                        name: "机构2",
                        value: 12,
                        itemStyle: {
                            color: "#57c5a2"
                        }
                    },
                    {
                        name: "机构1",
                        value: 12,
                        itemStyle: {
                            color: "#86cb68"
                        }
                    }
                ]
            }]
    };
    myChart.setOption(option);
    return myChart;
};
function chart06(id) {
    var myChart = echarts.init(document.getElementById(id));
    var option = {
        legend: {
            orient: 'vertical',
            left: 'center',
            itemHeight: 7,
            itemWidth: 7,
            itemGap: 25,
            width: 200,
            height: 30,
            bottom: 20,
            data: [
                {
                    name: '外送检验',
                    icon: 'circle'
                }, {
                    name: '本院检验',
                    icon: 'circle'
                }
            ]
        },
        series: [
            {
                type: 'pie',
                radius: ['48%', '59%'],
                center: ['50%', '50%'],
                avoidLabelOverlap: false,
                hoverOffset: 8,//悬浮偏移距离
                label: {
                    show: true,
                    fontSize: 13,
                    formatter: function (params) {
                        return "{a|" + params.data.name + "\n" + "共" + params.data.value + "条}" + "\n" + "{b|占比：" + params.percent + "%}"
                    },
                    lineHeight: 18,
                    rich: {
                        a: {
                            color: "#333",
                            fontSize: 12
                        },
                        b: {
                            color: "#333333",
                            fontSize: 13
                        }
                    }
                },
                labelLine: {
                    show: true,
                    length: 10,
                    length2: 15
                },
                data: [
                    {
                        value: 30000,
                        name: '外送检验',
                        itemStyle: {
                            color: "#527df9"
                        }
                    },
                    {
                        value: 88879,
                        name: '本院检验',
                        itemStyle: {
                            color: "#fcb145"
                        }
                    }
                ]
            }
        ]
    };

    myChart.setOption(option);
    return myChart;
};
function chart07(id) {
    var myChart = echarts.init(document.getElementById(id));
    var option = {
        legend: {
            orient: 'vertical',
            left: 'center',
            itemHeight: 7,
            itemWidth: 7,
            itemGap: 25,
            height: 30,
            bottom: 20,
            data: [
                {
                    name: '远程影像',
                    icon: 'circle'
                },
                {
                    name: '本院影像',
                    icon: 'circle'
                }
            ]
        },
        series: [
            {
                type: 'pie',
                radius: ['48%', '59%'],
                center: ['50%', '50%'],
                avoidLabelOverlap: false,
                hoverOffset: 8,//悬浮偏移距离
                label: {
                    show: true,
                    fontSize: 13,
                    formatter: function (params) {
                        return "{a|" + params.data.name + "\n" + "共" + params.data.value + "条}" + "\n" + "{b|占比：" + params.percent + "%}"
                    },
                    lineHeight: 18,
                    rich: {
                        a: {
                            color: "#333",
                            fontSize: 12
                        },
                        b: {
                            color: "#333333",
                            fontSize: 13
                        }
                    }
                },
                labelLine: {
                    show: true,
                    length: 10,
                    length2: 15
                },
                data: [
                    {
                        value: 30000,
                        name: '远程影像',
                        itemStyle: {
                            color: "#ee7a8d"
                        }
                    },
                    {
                        value: 88879,
                        name: '本院影像',
                        itemStyle: {
                            color: "#f7a932"
                        }
                    }
                ]
            }
        ]
    };

    myChart.setOption(option);
    return myChart;
};
function chart08(id) {
    var myChart = echarts.init(document.getElementById(id));
    var option = {
        tooltip: {
            trigger: "axis",
            axisPointer: {
                type: "shadow"
            }
        },
        legend: {
            orient: 'vertical',
            right: "8%",
            itemGap: 12,
            height: 20,
            top: 17,
            itemWidth:19,
            itemHeight:9,
            data: [
                {
                    name: '门诊人次',
                },
                {
                    name: '入院人次',
                },
                {
                    name: '出院人次',
                }
            ]
        },
        grid: {
            left: "17%",
            right: "8%",
            bottom: "15%",
            top: "15%"
        },
        xAxis: {
            type: "category",
            boundaryGap: true,
            zlevel: 10,
            axisTick: {
                show: false
            },
            axisLabel: {
                show: true,
                color: "#333",
                fontSize: 13,
                interval: 5,
                margin: 15
            },
            axisLine: {
                show: true,
                lineStyle: {
                    color: "#9fa6b2"
                }
            },
            splitLine: {
                show: false,
            },
            splitArea: {
                show: false,
                color: ["#f6f8fb", "#fff"]
            },
            data: ["2019-10-06", "2019-10-07", "2019-10-08", "2019-10-09", "2019-10-10", "2019-10-11", "2019-10-12", "2019-10-13", "2019-10-14", "2019-10-15", "2019-10-16", "2019-10-17", "2019-10-18", "2019-10-19", "2019-10-20", "2019-10-21", "2019-10-22", "2019-10-23", "2019-10-24"]
        },
        yAxis: {
            type: "value",
            name: "人数",
            zlevel: 0,
            nameTextStyle: {
                color: "#333",
                fontSize: 13
            },
            axisTick: {
                show: false
            },
            axisLine: {
                show: true,
                lineStyle: {
                    color: "#9fa6b2"
                }
            },
            splitLine: {
                show: true,
                lineStyle: {
                    color: "#d3dae6"
                }
            },
            axisLabel: {
                show: true,
                color: "#333",
                fontSize: 13,
                interval: 0,
                margin:12
            },
        },
        series: [
            {
                name: "门诊人次",
                type: "line",
                symbolSize: 8,
                smooth: true,
                itemStyle: {
                    color: "#2e82ff",
                    borderWidth:2,
                },
                lineStyle: {
                    color: '#2e82ff',
                    width: 1
                },
                data: [3800,4000, 4100, 4400, 4200, 4600, 4800, 4000, 4100, 4400, 4200, 4600, 4800, 4000, 4100, 4400, 4200, 4600, 4800]
            },
            {
                name: "入院人次",
                type: "line",
                symbolSize: 8,
                smooth: true,
                itemStyle: {
                    color: "#ee7c8e",
                    borderWidth:2,
                },
                lineStyle: {
                    color: '#ee7c8e',
                    width: 1
                },
                data: [1800,2000, 2100, 2200, 2200, 2600, 2800, 2000, 2100, 2200, 2200, 2600, 2800, 2000, 2100, 2200, 2200, 2600, 2800]
            },
            {
                name: "出院人次",
                type: "line",
                symbolSize: 8,
                smooth: true,
                itemStyle: {
                    color: "#f7ab38",
                    borderWidth:2,
                },
                lineStyle: {
                    color: '#f7ab38',
                    width: 1
                },
                data: [890,1000, 1100, 1200, 1200, 1600, 1800, 1000, 1100, 1100, 1200, 1600, 1800, 1000, 1100, 1100, 1200, 1600, 1800]
            }
        ]
    };
    myChart.setOption(option);
    return myChart;
};
function chart09(id) {
    var myChart = echarts.init(document.getElementById(id));
    option = {
        tooltip: {
            trigger: 'item',
            formatter: "{a} <br/>{b}: {c} ({d}%)"
        },
        legend: {
            bottom: 0,
            itemHeight:8,
            itemWidth:8,
            data: [
                {
                    name: "机构1",
                    icon: "circle"
                },
                {
                    name: "机构2",
                    icon: "circle"
                },
                {
                    name: "机构3",
                    icon: "circle"
                },
                {
                    name: "机构4",
                    icon: "circle"
                }
            ]
        },
        series: [
            {
                name:"区域手术汇总",
                type: 'pie',
                radius: ['45%', '62%'],
                center: ['50%', '40%'],
                avoidLabelOverlap: true,
                hoverOffset:4,
                itemStyle: {
                    borderColor: '#fff',
                    borderWidth: 2,
                },
                label: {
                    show: true,
                    fontSize: 13,
                    formatter: function (params) {
                        return "{a|" + params.data.name + "}" + "\n " + "{b|占比:" + params.percent + "%}"
                    },
                    lineHeight: 18,
                    rich: {
                        a: {
                            color: "#333",
                            fontSize: 13
                        },
                        b: {
                            color: "#333",
                            fontSize: 13
                        }
                    }
                },
                labelLine: {
                    show: true,
                    length: 12,
                    length2: 8,
                    lineStyle: {
                        color: '#627da3',
                    }
                },
                data: [
                    {
                        name: "机构1",
                        value: 12,
                        itemStyle: {
                            color: "#00adf4"
                        }
                    },

                    {
                        name: "机构2",
                        value: 4,
                        itemStyle: {
                            color: "#86cb68"
                        }
                    },
                    {
                        name: "机构3",
                        value: 12,
                        itemStyle: {
                            color: "#9884f3"
                        }
                    },
                    {
                        name: "机构4",
                        value: 12,
                        itemStyle: {
                            color: "#6288d1"
                        }
                    }
                ]
            }]
    };
    myChart.setOption(option);
    return myChart;
};
function chart10(id) {
    var myChart = echarts.init(document.getElementById(id));
    option = {
        tooltip: {
            trigger: 'item',
            formatter: "{a} <br/>{b}: {c} ({d}%)"
        },
        legend: {
            bottom: 0,
            itemHeight:8,
            itemWidth:8,
            data: [
                {
                    name: "户籍建档",
                    icon: "circle"
                },
                {
                    name: "非户籍建档",
                    icon: "circle"
                },
                {
                    name: "机其他建档",
                    icon: "circle"
                }
            ]
        },
        series: [
            {
                name:"全区建档人数",
                type: 'pie',
                radius: ['45%', '62%'],
                center: ['50%', '40%'],
                avoidLabelOverlap: true,
                hoverOffset:4,
                itemStyle: {
                    borderColor: '#fff',
                    borderWidth: 2,
                },
                label: {
                    show: true,
                    fontSize: 13,
                    formatter: function (params) {
                        return "{a|" + params.data.name + "}" + "\n " + "{b|占比:" + params.percent + "%}"
                    },
                    lineHeight: 18,
                    rich: {
                        a: {
                            color: "#333",
                            fontSize: 13
                        },
                        b: {
                            color: "#333",
                            fontSize: 13
                        }
                    }
                },
                labelLine: {
                    show: true,
                    length: 12,
                    length2: 8,
                    lineStyle: {
                        color: '#627da3',
                    }
                },
                data: [
                    {
                        name: "户籍建档",
                        value: 12,
                        itemStyle: {
                            color: "#00adf4"
                        }
                    },

                    {
                        name: "非户籍建档",
                        value: 4,
                        itemStyle: {
                            color: "#9884f3"
                        }
                    },
                    {
                        name: "其他建档",
                        value: 12,
                        itemStyle: {
                            color: "#6288d1"
                        }
                    }
                ]
            }]
    };
    myChart.setOption(option);
    return myChart;
};
function chart11(id) {
    var myChart = echarts.init(document.getElementById(id));
    var data =  [2700,2210,2090,1876,1734,1567,1234,1134, 1098, 1076,987,765,453,333, 222 ];

    var dataShadow = [];
    var xMax = 3000;
    for (var i = 0; i < data.length; i++) {
        dataShadow.push({
            value: xMax,
            value2: data[i]
        });
    }
    ;

    option = {
        tooltip: {
            trigger: "axis",
            axisPointer: {
                type: "shadow"
            }
        },
        grid: {
            // left: "22%",
            containLabel: true,
            left: 0,
            right: "12%",
            bottom: "0%",
            top: "4%"
        },
        xAxis: {
            type: "value",
            min: 0,
            max: xMax,
            boundaryGap: true,
            axisTick: {
                show: false
            },
            axisLabel: {
                show: false,
            },
            splitLine: {
                show: false,
            },
            axisLine: {
                show: false,
            },
        },
        yAxis: {
            type: "category",
            axisTick: {
                show: false
            },
            axisLine: {
                show: false
            },
            axisLabel: {
                interval: 0,
                color: "#333",
                fontSize: 14,
            },
            data: ["人工破膜引产","去除泌尿系统其他装置", "去除泌尿系统其他装置", "皮肤病损切除术","皮下组织病损切除术","会阴裂伤缝合术",
                 "腹腔镜下阑尾切除术","腹腔镜下阑尾切除术", "内镜下大肠息肉切除术","内镜下大肠息肉切除术", "其他手法助产",
                 "剖宫产术、子宫下段横切口","电子结肠镜检查","近期产科会阴裂伤修补术","经腹胃镜检查"
        ]
        },
        color: "#43bcf4",
        series: [
            {
                // For shadow
                type: "bar",
                itemStyle: {
                    normal: {
                        color: "#ffecc8",
                        barBorderRadius: [3, 3, 3, 3]
                    }
                },
                label: {
                    show: true,
                    position: "right",
                    fontSize: 14,
                    color: "#333",
                    padding: [0, 0, 0, 10],
                    formatter: function (params) {
                        console.log(params.data.value2);
                        return params.data.value2
                    }

                },
                barWidth: 10,
                barGap: "-100%",
                barCategoryGap: "40%",
                data: dataShadow.reverse(),
                animation: false
            },
            {
                type: "bar",
                barWidth: 10,
                itemStyle: {
                    color: "#ffb820",
                    barBorderRadius: [3, 3, 3, 3],
                },

                data: data.reverse(),
            }
        ]
    };
    myChart.setOption(option);
    return myChart;
};
function chart12(id) {
    var myChart = echarts.init(document.getElementById(id));
    var data = [2700,2210,2090,1876,1734,1567,1234,1134,1098, 1076,987, 765,453, 333,222]

    var dataShadow = [];
    var xMax = 3000;
    for (var i = 0; i < data.length; i++) {
        dataShadow.push({
            value: xMax,
            value2: data[i]
        });
    }
    ;

    option = {
        tooltip: {
            trigger: "axis",
            axisPointer: {
                type: "shadow"
            }
        },
        grid: {
            // left: "22%",
            containLabel: true,
            left: 0,
            right: "14%",
            bottom: "0%",
            top: "4%"
        },
        xAxis: {
            type: "value",
            min: 0,
            max: xMax,
            boundaryGap: true,
            axisTick: {
                show: false
            },
            axisLabel: {
                show: false,
            },
            splitLine: {
                show: false,
            },
            axisLine: {
                show: false,
            },
        },
        yAxis: {
            type: "category",
            axisTick: {
                show: false
            },
            axisLine: {
                show: false
            },
            axisLabel: {
                interval: 0,
                color: "#333",
                fontSize: 14,
            },
            data:["疾病名称",  "疾病名称","疾病名称", "疾病名称疾病名称", "疾病名称","疾病名称", "疾病名称","疾病名称疾病名称","疾病名称", "疾病名称疾病名称","疾病名称","疾病名称", "疾病名称疾病名称","疾病名称","疾病名称"]
        },
        color: "#43bcf4",
        series: [
            {
                // For shadow
                type: "bar",
                itemStyle: {
                    color: "#bce8da",
                    barBorderRadius: [3, 3, 3, 3]
                },
                label: {
                    show: true,
                    position: "right",
                    fontSize: 13,
                    color: "#333",
                    padding: [0, 0, 0, 10],
                    formatter: function (params) {
                        console.log(params.data.value2);
                        return params.data.value2
                    }

                },
                barWidth: 10,
                barGap: "-100%",
                barCategoryGap: "40%",
                data: dataShadow.reverse(),
                animation: false
            },
            {
                type: "bar",
                barWidth: 10,
                itemStyle: {
                    barBorderRadius: [3, 3, 3, 3],
                    color:"#57c5a2"
                },

                data: data.reverse(),
            }
        ]
    };
    myChart.setOption(option);
    return myChart;
};

//进度条

function chartRank(id, data, max) {
    var $_id = $(id);
    var html = "";
    $.each(data, function (index, value) {
        var percent = (value.value / max * 100).toFixed(2);
        if (id === "#topList01") {
            console.log(123);
            html += '<li>' +
                '<h5 class="name">' + value.name + '</h5>' +
                '<div class="bar">' +
                '<div class="bar-box">' +
                '<div class="bar-inner" style="width:' + percent + '%;"></div>' +
                '</div>' +
                '<span class="number"><span class="rate">使用率</span>' + percent + '%</span>' +
                '</div>' +
                '</li>';
        } else {
            html += '<li>' +
                '<h5 class="name">' + value.name + '</h5>' +
                '<div class="bar">' +
                '<div class="bar-box">' +
                '<div class="bar-inner" style="width:' + percent + '%;"></div>' +
                '</div>' +
                '<span class="number">' + value.value + '</span>' +
                '</div>' +
                '</li>';
        }
    });
    $_id.html(html);
};
var mockData = {
    top01: [
        {
            name: "综合医院床位",
            value: 1844,
        },
        {
            name: "基层医院床位",
            value: 2456
        }
    ]
}
chartRank('#topList01', mockData.top01, 3000);


$(function () {
    var chartInit01 = chart01("chart01");
    var chartInit02 = chart02("chart02");
    var chartInit03 = chart03("chart03");
    var chartInit04 = chart04("chart04");
    var chartInit05 = chart05("chart05");
    var chartInit06 = chart06("chart06");
    var chartInit07 = chart07("chart07");
    var chartInit08 = chart08("chart08");
    var chartInit09 = chart09("chart09");
    var chartInit10 = chart10("chart10");
    var chartInit11 = chart11("chart11");
    var chartInit12 = chart12("chart12");

    function gl(el) {
        //默认其中一个高亮
        el.dispatchAction({
            type: 'highlight',
            dataIndex: 0,
        });

        //离开其中一个模块高亮取消，默认第一块高亮
        el.on("mouseout", function (params) {
            console.log(params);
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
    gl(chartInit06);
    gl(chartInit07);


    $(window).resize(function () {
        chartInit01.resize();
        chartInit02.resize();
        chartInit03.resize();
        chartInit04.resize();
        chartInit05.resize();
        chartInit06.resize();
        chartInit07.resize();
        chartInit08.resize();
        chartInit09.resize();
        chartInit10.resize();
        chartInit11.resize();
        chartInit12.resize();
        gl(chartInit06);
        gl(chartInit07);
    });
});
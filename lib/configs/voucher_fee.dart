//리스트 = [단축,표준,연장]순의 가격
Map<String, List<int>> govermentFeeInfo = {
  '일반서비스': [0, 0, 0, 0, 0],
  'A-가-1': [521000, 894000, 1211000, 1211000, 1211000],
  'A-통합-1': [460000, 790000, 1070000, 1070000, 1070000],
  'A-라-1': [368000, 633000, 858000, 858000, 858000],
  'A-가-2': [1069000 ~/ 2, 1069000, 1376000, 1656000, 1656000],
  'A-통합-2': [944000 ~/ 2, 944000, 1215000, 1463000, 1463000],
  'A-라-2': [756000 ~/ 2, 756000, 974000, 1173000, 1173000],
  'A-가-3': [1110000 ~/ 2, 1110000, 1428000, 1718000, 1718000],
  'A-통합-3': [979000 ~/ 2, 979000, 1261000, 1518000, 1518000],
  'A-라-3': [784000 ~/ 2, 784000, 1010000, 1217000, 1217000],
  'B-가-1': [1477000 ~/ 2, 1477000, 1899000, 2284000, 2284000],
  'B-통합-1': [1303000 ~/ 2, 1303000, 1676000, 2017000, 2017000],
  'B-라-1': [1042000 ~/ 2, 1042000, 1341000, 1615000, 1615000],
  'B-가-2': [2026000 ~/ 2, 2026000, 2701000, 3337000, 3337000],
  'B-통합-2': [1840000 ~/ 2, 1840000, 2463000, 3051000, 3051000],
  'B-라-2': [1561000 ~/ 2, 1561000, 2106000, 2622000, 2622000],
  'C-가': [3477000 ~/ 3, 3477000 ~/ 2, 3477000, 4151000, 4832000],
  'C-통합': [3177000 ~/ 3, 3177000 ~/ 2, 3177000, 3809000, 4447000],
  'C-라': [2726000 ~/ 3, 2726000 ~/ 2, 2726000, 3295000, 3868000],
};

Map<String, List<int>> serviceFeeInfo = {
  '일반서비스': [592000, 1184000, 1776000, 1776000 + 592000, 1776000 + (592000 * 2)],
  'A-가-1': [592000, 1184000, 1776000, 1776000 + 592000, 1776000 + (592000 * 2)],
  'A-통합-1': [
    592000,
    1184000,
    1776000,
    1776000 + 592000,
    1776000 + (592000 * 2)
  ],
  'A-라-1': [
    592000,
    1184000,
    1776000,
    totalFeePerWeek["type1"] * 4,
    totalFeePerWeek["type1"] * 5
  ],
  'A-가-2': [
    totalFeePerWeek["type1"],
    1184000,
    1776000,
    2368000,
    totalFeePerWeek["type1"] * 5
  ],
  'A-통합-2': [
    totalFeePerWeek["type1"],
    1184000,
    1776000,
    2368000,
    totalFeePerWeek["type1"] * 5
  ],
  'A-라-2': [
    totalFeePerWeek["type1"],
    1184000,
    1776000,
    2368000,
    totalFeePerWeek["type1"] * 5
  ],
  'A-가-3': [
    totalFeePerWeek["type1"],
    1184000,
    1776000,
    2368000,
    totalFeePerWeek["type1"] * 5
  ],
  'A-통합-3': [
    totalFeePerWeek["type1"],
    1184000,
    1776000,
    2368000,
    totalFeePerWeek["type1"] * 5
  ],
  'A-라-3': [
    totalFeePerWeek["type1"],
    1184000,
    1776000,
    2368000,
    totalFeePerWeek["type1"] * 5
  ],
  'B-가-1': [
    totalFeePerWeek["type2"],
    1520000,
    2280000,
    3040000,
    totalFeePerWeek["type2"] * 5,
  ],
  'B-통합-1': [
    totalFeePerWeek["type2"],
    1520000,
    2280000,
    3040000,
    totalFeePerWeek["type2"] * 5,
  ],
  'B-라-1': [
    totalFeePerWeek["type2"],
    1520000,
    2280000,
    3040000,
    totalFeePerWeek["type2"] * 5,
  ],
  'B-가-2': [
    totalFeePerWeek["type3"],
    2072000,
    3108000,
    4144000,
    totalFeePerWeek["type3"] * 5,
  ],
  'B-통합-2': [
    totalFeePerWeek["type3"],
    2072000,
    3108000,
    4144000,
    totalFeePerWeek["type3"] * 5,
  ],
  'B-라-2': [
    totalFeePerWeek["type3"],
    2072000,
    3108000,
    4144000,
    totalFeePerWeek["type3"] * 5,
  ],
  'C-가': [
    totalFeePerWeek["type4"],
    totalFeePerWeek["type4"] * 2,
    3552000,
    4736000,
    5920000
  ],
  'C-통합': [
    totalFeePerWeek["type4"],
    totalFeePerWeek["type4"] * 2,
    3552000,
    4736000,
    5920000
  ],
  'C-라': [
    totalFeePerWeek["type4"],
    totalFeePerWeek["type4"] * 2,
    3552000,
    4736000,
    5920000
  ],
};

//한주당 서비스 가격(바우처 타입마다 달라지는 주당 요금)
Map totalFeePerWeek = {
  'type1': 592000,
  'type2': 760000,
  'type3': 1036000,
  'type4': 1184000,
};

Iterable<int> depositFeePerWeek = [50000, 50000, 100000, 100000, 100000];

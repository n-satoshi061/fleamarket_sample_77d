$(window).on('load', function () {

  // ユーザーの誕生日の閏年を動的に変化させる
  let birth_year = [];
  let birth_month = [];
  let months = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31];

  // 現在の年を取得
  let date = new Date();
  let this_year = date.getFullYear();
  let oldest_year = 1900;

  // 誕生年月の配列を自動生成
  for (let i = this_year; i >= oldest_year; i--) {
    let year = { let: i, txt: String(i) };
    birth_year.push(year);
  }
  for (let i = 1; i <= 12; i++) {
    let month = { let: i, txt: String(i) };
    birth_month.push(month);
  }
  // 年・月のセレクトボックスに配列内容を反映
  for (let i = 0; i < birth_year.length; i++) {
    $("<option>", {
      value: birth_year[i].var,
      text: birth_year[i].txt
    }).appendTo('#select_birthyear');
  }
  for (let i = 0; i < birth_month.length; i++) {
    $("<option>", {
      value: birth_month[i].var,
      text: birth_month[i].txt
    }).appendTo('#select_birthmonth');
  }

  // 年、もしくは月のセレクトボックスの中身に変更があった時、日の内容を変更する
  $('#select_birthyear, #select_birthmonth').change(function () {

    $('#select_birthday').empty();

    $("<option>", {
      text: '--'
    }).appendTo('#select_birthday');

    months[1] = 28;

    let year = $('#select_birthyear').val();
    let month = $("#select_birthmonth").val();
    // '--'でないとき実行
    if (year != '--' && month != '--') {
      if (month == 2) {
        // yearが閏年の時、2月の日付が格納されているmonths[1]の値を29にする
        if (year % 4 == 0 && year % 100 == 0 && year % 400 == 0) {
          months[1] = 29;
        }
      }

      let birth_day = []
      for (let i = 1; i <= months[month - 1]; i++) {
        let day = { let: i, txt: String(i) };
        birth_day.push(day);
      }
      for (let i = 0; i < birth_day.length; i++) {
        $("<option>", {
          value: birth_day[i].var,
          text: birth_day[i].txt
        }).appendTo('#select_birthday');
      };
    };
  });

  $('.selected').change(function() {
    let select_error = false;
    let value = $(this).val();

    // 入力が無い場合、エラー
    if( value === '--' || value === '' ) {
      select_error = true;
    }

    if( select_error ){
      if( $(this).parent().parent().next('div.error').length ){
        $(this).parent().parent().next('div.error').remove();
      }
      $(this).parent().parent().after('<div class="error">入力してください</div>');
    }else{
      $(this).parent().parent().next('div.error').remove();
    }
  });
});

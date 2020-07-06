$(function() {
  // フォームに入力が無かった場合のエラーメッセージを表示
  $('.required').on('blur', function() {
    let empty_error = false;
    let value = $(this).val();

    // 入力が無い場合、エラー
    if( value === '' ) {
      empty_error = true;
    }

    if( empty_error ){
      if( $(this).parent().next('div.error').length || $(this).parent().next('div.match_error').length){
        $(this).parent().next('div.error').remove();
        $(this).css('border-color', '#ccc');
      }
      $(this).parent().after('<div class="error">入力してください</div>');
      $(this).css('border-color', 'red');
    }else{
      $(this).parent().next('div.error').remove();
      $(this).css('border-color', '#ccc');
    }
  });

  // フォーム内に入力が無かった場合とフォーム内の入力が指定のものでなかった場合のエラーメッセージを表示
  $('.invalid_data').on('blur', function() {
    let empty_error = false;
    let input_error = false;
    let value = $(this).val();

    // 入力が無い場合、エラー
    if( value === '' ) {
      empty_error = true;
    }

    if( this.id == 'user_email' ){
      // emailに@とドメインを含む
      if( !value.match(/^[-a-z0-9~!$%^&*_=+}{\'?]+(\.[-a-z0-9~!$%^&*_=+}{\'?]+)*@([a-z0-9_][-a-z0-9_]*(\.[-a-z0-9_]+)*\.(aero|arpa|biz|com|coop|edu|gov|info|int|mil|museum|name|net|org|pro|travel|mobi|[a-z][a-z])|([0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}))(:[0-9]{1,5})?$/i) ){
        input_error = true;
      }
    } else if( this.id == 'user_tel' ){
      // 数字11桁又はハイフン含む形(000-1111-2222)
      if( !value.match(/^\d{3}-\d{4}-\d{4}$|^\d{11}$/) ){
        input_error = true;
      }
    } else if( $(this).attr('class').indexOf('valid_formal_name') != -1 ){
      // 全角ひらがな、全角カタカナ、漢字での入力可
      if( !value.match(/^[ぁ-んァ-ン一-龥]/) ){
        input_error = true;
      }
    } else if( $(this).attr('class').indexOf('valid_name_kana') != -1 ){
      // 全角カタカナのみ
      if( !value.match(/^([ァ-ン]|ー)+$/) ){
        input_error = true;
      }
    } else if( $(this).attr('class').indexOf('valid_password') != -1 ){
      // 半角アルファベットと数値で7文字以上
      if( !value.match(/^(?=.*?[a-z])(?=.*?\d)[a-z\d]{7,100}$/i) ){
        input_error = true;
      }
    } else if( this.id == 'card_number' ){
      // 数字16桁
      if( !value.match(/^\d{16}$/) ){
        input_error = true;
      }
    } else if( this.id == 'cvc' ){
      // 数字16桁
      if( !value.match(/^\d{3,4}$/) ){
        input_error = true;
      }
    }

    if( empty_error ){
      if( $(this).parent().next('div.error').length || $(this).parent().next('div.match_error').length ){
        $(this).parent().next('div.error').remove();
        $(this).css('border-color', '#ccc');
      }
      $(this).parent().after('<div class="error">入力してください</div>');
      $(this).css('border-color', 'red');
    } else {
      if( input_error ) {
        if( $(this).parent().next('div.error').length || $(this).parent().next('div.match_error').length ) {
          $(this).parent().next('div.error').remove();
          $(this).css('border-color', '#ccc');
        }
        $(this).parent().after('<div class="error">入力不正です</div>');
        $(this).css('border-color', 'red');
      }else{
        $(this).parent().next('div.error').remove();
        $(this).css('border-color', '#ccc');
      }
    }
  });

  $('#user_email').on('blur', function() {
    $(".matcher").each(function(i, o){
      if( $(o).val() === $("#user_email").val()){
        if( $(this).parent().next('div.match_error').length || $(this).parent().next('div.error').length ) {
          $(this).parent().next('div.match_error').remove();
          $(this).css('border-color', '#ccc');
        }
        $(this).parent().after('<div class="match_error">既に登録されたメールアドレスです</div>');
        $(this).css('border-color', 'red');
      }else{
        $(this).parent().next('div.match_error').remove();
        $(this).css('border-color', '#ccc');
      }
    });
  });

  $('#check_password_confirmation').on('blur', function() {
    let password = $('#check_password_confirmation').val();
    let password_confirmation = $('#check_password').val();

    if( password != password_confirmation){
      if( $(this).parent().next('div.match_error').length || $(this).parent().next('div.error').length ){
        $(this).parent().next('div.match_error').remove();
        $(this).css('border-color', '#ccc');
      }
      $(this).parent().after('<div class="match_error">入力値が一致しません</div>');
      $(this).css('border-color', 'red');
    }else{
      $(this).parent().next('div.match_error').remove();
      $(this).css('border-color', '#ccc');
    }
  });

  //始めにjQueryで送信ボタンを無効化する
  $('.step_btn').prop("disabled", true);
  $('.step_btn').css('background-color', '#ccc');
  $('.step_btn').css('border-color', '#ccc');

  $('.required,.invalid_data,.selected').change(function() {

      let flag = true;

      $('.required,.invalid_data,.selected').each(function(e) {
        if ($('.required,.invalid_data,.selected').eq(e).val() === "") {
          flag = false;
        }
        if ($('.selected').eq(e).val() === '--') {
          flag = false;
        }
      });

      let error = $('.box').find('div.error').length + $('.box').find('div.match_error').length;

      if ( flag && error == 0 ) {
          //送信ボタンを復活
          $('.step_btn').prop("disabled", false);
          $('.step_btn').css('background-color', '#ea352d');
          $('.step_btn').css('border-color', '#ea352d');
      }
      else {
          //送信ボタンを閉じる
          $('.step_btn').prop("disabled", true);
          $('.step_btn').css('background-color', '#ccc');
          $('.step_btn').css('border-color', '#ccc');
      }
  });
});

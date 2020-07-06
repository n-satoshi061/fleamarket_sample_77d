$(document).on('turbolinks:load', ()=> {
  // 画像用inputを生成する関数
  const buildFileField = (num)=> {
    const html = `<div data-index="${num}" class="js-image">
    <input class="js-file" type="file"
    name="product[images_attributes][${num}][image]" 
    id="product_images_attributes_${num}_image"><br>
    <div class="js-remove">削除</div>
    </div>`;
    return html;
  }
  
  // プレビュー用関数
  const buildImg = (index, url)=> {
    const html = `<img data-index="${index}" src="${url}" width="100px" height="100px">`;
    return html;
  }

  let fileIndex = [1,2,3,4,5];

  lastIndex = $('.js-image:last').data('index');
  fileIndex.splice(0, lastIndex);
  
  $('.hidden-destroy').hide();

  $('.contents__form__display__body__image__box').on('change', '.js-file', function(e) {
    const targetIndex = $(this).parent().data('index');
    const file = e.target.files[0];
    const blobUrl = window.URL.createObjectURL(file);

    let image_length = $(".js-image").length

    // ５枚以上の投稿制限
    if ($(".js-image").length >= 6) {
      alert("これ以上投稿できない")
      return false;
    }
    // 該当indexを持つimgがあれば取得して変数imgに入れる(画像変更の処理)
    if (img = $(`img[data-index="${targetIndex}"]`)[0]) {
      img.setAttribute('image', blobUrl);
    } else if(image_length < 6){  
      // 
      $('.contents__form__display__body__image__box__previews').append(buildImg(targetIndex, blobUrl));
      // fileIndex、新規投稿分の配列を取り除く
      $('.contents__form__display__body__image__box').append(buildFileField(fileIndex[0]));
      fileIndex.shift();
      // 配列のダブりをなくす
      fileIndex.push(fileIndex[fileIndex.length - 1] + 1);
    }
  });

  //削除機能
  $('.contents__form__display__body__image__box').on('click', '.js-remove', function() {
    const targetIndex = $(this).parent().data('index');
    // 該当indexを振られているチェックボックスを取得する
    const hiddenCheck = $(`input[data-index="${targetIndex}"].hidden-destroy`);
    // チェックボックスが存在すればチェックを入れる
    if (hiddenCheck) hiddenCheck.prop('checked', true);

    $(this).parent().remove();
    $(`img[data-index="${targetIndex}"]`).remove();

    // 画像入力欄が0個にならないようにしておく
    if ($('.js-file').length == 0) $('.contents__form__display__body__image__box').append(buildFileField(fileIndex[0]));
  });
});

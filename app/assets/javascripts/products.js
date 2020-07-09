$(function() {
  // 画像用inputを生成する関数
  const buildFileField = num => {
    const html = `<div data-index="${num}" class="js-image">
                  <input class="js-file" type="file" data-index="${num}"
                  name="product[images_attributes][${num}][image]"
                  id="product_images_attributes_${num}_image"><br>
                  </div>`;
    return html;
  };

  // プレビュー用関数
  const buildImg = (index, url) => {
    const html = `<div data-index="${index}" class="phote">
                  <image src="${url}" width="120px" height="150px">
                  <button class="js-remove ">削除</button>
                  </div>`;
    return html;
  };

  let fileIndex = [1, 2, 3, 4, 5];

  lastIndex = $(".js-image:last").data("index");
  fileIndex.splice(0, lastIndex);
  //すでに使われている配列を取り除く

  $(".hidden-destroy").hide();
  //非表示にする

  $(".contents__form__display__body__image").on(
    "click",
    "#image-box",
    function() {
      const Btn = $(".js-file:last");

      let image_length = $(".js-image").length;
      // //js-imageで投稿数を代入

      // // ５枚以上の投稿制限
      if ($(".js-image").length >= 6) {
        alert("これ以上投稿出来ません");
        return false;
      } else {
        $(Btn).trigger("click");
      }
    }
  );

  $(".contents__form__display__body__image").on("change", ".js-file", function(
    e
  ) {
    let image_length = $(".js-image").length;
    // //js-imageで投稿数を代入

    // // ５枚以上の投稿制限
    if ($(".js-image").length >= 6) {
      alert("これ以上投稿出来ません");
      return false;
    }
    //js-fileが変化された場合に発火（file_field)
    const targetIndex = $(this)
      .parent()
      .data("index");
    //登録されるデータ（data('index'))=js-fileの親要素であるdata-index="${num}を指定（過去分）
    const file = e.target.files[0];
    //選択したevent要素の中のfileにtargetを絞り、fileに代入（配列は０から始まるので０）。fileだけが欲しい為
    const blobUrl = window.URL.createObjectURL(file);
    //const file で取り出したファイルをURLに変換。windowは今のページのみ有効。遷移すると消滅。その情報を blobUrlに代入。blobUrl＝内部的な一時保存

    // 下記の上文は変更時の記述（２枚目以降しか発生しない）
    if ((img = $(`img[data-index="${targetIndex}"]`)[0])) {
      //過去に登録されたデータを指定しimgに代入（2枚目以降のため、必ず存在する）
      img.setAttribute("src", blobUrl);
      //過去に登録されたimgを新たに選択されたURL変化されたblobUrl)に変更。setAttribute＝src 属性の値を変更
    } else if (image_length < 6) {
      //画像追加時のアクション
      $("#image-box").append(buildImg(targetIndex, blobUrl));
      // プレビューを追加する（data-index="${num}（最初は０）、指定したファイルのURL)
      $("#previews").append(buildFileField(fileIndex[0]));

      //入力欄を表示。fileIndexの最初の数字を使って。
      // $("#image-box").prop("for", `item_images_attributes_${fileIndex[0]}_image`)
      fileIndex.shift();
      // fileIndex、新規投稿分の配列を取り除く。（shiftは一番最初の配列を取り除く為）＝投稿したら配列取り除く
      fileIndex.push(fileIndex[fileIndex.length - 1] + 1);
    } // 配列のダブりをなくす
  });

  //削除機能
  $(".contents__form__display__body__image").on("click", ".js-remove", function(
    evt
  ) {
    evt.stopPropagation();
    //.js-removeがクリックされた時に発火
    const targetIndex = $(this)
      .parent()
      .data("index");
    // console.log(tagetIndex)
    //登録されるデータ（data('index'))=js-fileの親要素であるdata-index="${num}を指定（過去分）
    const hiddenCheck = $(`input[data-index="${targetIndex}"].hidden-destroy`);
    //該当indexを振られているチェックボックスを取得する
    if (hiddenCheck) hiddenCheck.prop("checked", true);
    // チェックボックスが存在すればチェックを入れる.prpo=取得
    // console.log(targetIndex)
    const fileinput = $(`#product_images_attributes_${targetIndex}_image`);
    $(this)
      .parent()
      .remove();
    // 親要素を削除。新規はinput、編集はプレビュー
    // if (path == new_path){
    // 新規投稿時にビューを削除する
    $(`img[data-index="${targetIndex}"]`).remove();
    fileinput.parent().remove();
    // } else if (path == edit_path){
    // // 編集時inputを削除する
    //   $(`input[data-index="${targetIndex}"]`).remove();
    // }
    // 画像入力欄が0個にならないようにしておく
    if ($(".js-file").length == 0)
      $("#image-box").append(buildFileField(fileIndex[0]));

    $('input[data-index = "${targetIndex}"]').css({ display: "none" });
  });
});

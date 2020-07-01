  $(function(){
    // カテゴリーセレクトボックスのオプションを作成
    function appendOption(category){
      let html = `<option value="${category.id}" data-category="${category.id}">${category.name}</option>`;
      return html;
    }
    // 子カテゴリーの表示作成
    function appendChildrenBox(insertHTML){
      let childSelectHtml = '';
      childSelectHtml = `<div class='contents__form__detail__category__text__added' id= 'children_wrapper'>
                          <select class="contents__form__detail__category__text--select" id="child_category" name="item[category_id]">
                            <option value="選択してください" data-category="選択してください">選択してください</option>
                            ${insertHTML}
                          <select>
                          </div>
                        </div>`;
      $('.contents__form__detail__category__text').append(childSelectHtml);
    }

    // 孫カテゴリーの表示作成
    function appendGrandchildrenBox(insertHTML){
      let grandchildSelectHtml = '';
      grandchildSelectHtml = `<div class='contents__form__detail__category__text__added' id= 'grandchildren_wrapper'>
                                <div class='contents__form__detail__category__text2'>
                                  <select class="contents__form__detail__category__text__select" id="grandchild_category" name="item[category_id]">
                                    <option value="選択してください" data-category="選択してください">選択してください</option>
                                    ${insertHTML}
                                  </select>
                                </div>
                              </div>`;
      $('.contents__form__detail__category__text').append(grandchildSelectHtml);
    }

    // 親カテゴリー選択後のイベント
    $('#parent_category').on('change', function(){
      let parent_category_id = document.getElementById('parent_category').value; //選択された親カテゴリーの名前を取得
      if (parent_category_id != "---"){ //親カテゴリーが初期値でないことを確認
        $.ajax({
          url: '/products/category/get_category_children',
          type: 'GET',
          data: { parent_id: parent_category_id },
          dataType: 'json'
        })
        .done(function(children){
          $('#children_wrapper').remove(); //親が変更された時、子以下を削除する
          $('#grandchildren_wrapper').remove();
          let insertHTML = '';
          children.forEach(function(child){
            insertHTML += appendOption(child);
          });
          appendChildrenBox(insertHTML);
        })
        .fail(function(){
          alert('カテゴリー取得に失敗しました');
        })
      }else{
        $('#children_wrapper').remove(); //親カテゴリーが初期値になった時、子以下を削除する
        $('#grandchildren_wrapper').remove();
      }
    });

    // 子カテゴリー選択後のイベント
    $('.contents__form__detail__category').on('change', '#child_category', function(){
      let child_category_id = $('#child_category option:selected').data('category'); //選択された子カテゴリーのidを取得
      if (child_category_id != "選択してください"){ //子カテゴリーが初期値でないことを確認
        $.ajax({
          url: '/products/category/get_category_grandchildren',
          type: 'GET',
          data: { child_id: child_category_id },
          dataType: 'json'
        })
        .done(function(grandchildren){
          if (grandchildren.length != 0) {
            $('#grandchildren_wrapper').remove(); //子が変更された時、孫以下を削除する
            let insertHTML = '';
            grandchildren.forEach(function(grandchild){
              insertHTML += appendOption(grandchild);
            });
            appendGrandchildrenBox(insertHTML);
          }
        })
        .fail(function(){
          alert('カテゴリー取得に失敗しました');
        })
      }else{
        $('#grandchildren_wrapper').remove(); //子カテゴリーが初期値になった時、孫以下を削除する
      }
    });
  });
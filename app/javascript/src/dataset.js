import Jcrop from "jcrop"

$(function() {
  var hasSelected = function() {
    console.log('選択されました')
  };

  var hasChanged = function() {
    console.log('変更されました');
  };

  var hasReleased = function() {
    console.log('リリースされました');
  };
  var onDblClick = function() {
    console.log('onDblClickされました');
  }
  var jcrop = Jcrop.attach('target_dataset', {
  // shadeColor: 'red',
  multi: true
  })
  jcrop.listen('crop.move',(widget,e) => {
    console.log(widget.pos);
  });
  const rect = Jcrop.Rect.create(100,0,100,100);
  const options = {};
  jcrop.newWidget(rect,options);
});

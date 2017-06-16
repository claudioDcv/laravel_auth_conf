function mask(elm, mask, evt) {
  try {
    var text = elm;
    var value = text.value;
    // If user pressed DEL or BACK SPACE, clean the value
    try {
      var e = (evt.which) ? evt.which : event.keyCode;
      if ( e == 46 || e == 8 ) {
        text.value = "";
        return;
      }
    } catch (e1) {}

    var literalPattern=/[0\*]/;
    var numberPattern=/[0-9]/;
    var newValue = "";

    for (var vId = 0, mId = 0 ; mId < mask.length ; ) {
      if (mId >= value.length)
        break;

      // Number expected but got a different value, store only the valid portion
      if (mask[mId] == '0' && value[vId].match(numberPattern) == null) {
        break;
      }

      // Found a literal
      while (mask[mId].match(literalPattern) == null) {
        if (value[vId] == mask[mId])
          break;
      newValue += mask[mId++];
    }
    newValue += value[vId++];
    mId++;
  }
  text.value = newValue;
} catch(e) {}
}

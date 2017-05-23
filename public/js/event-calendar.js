var Service = function(){
  function getEvent(filter){
    return Ajax.request({
      method: 'get',
      url: 'event?start=' + filter.start + '&end=' + filter.end,
      response: 'json',
    });
  }

  return {
    getEvent: getEvent,
  };
};

<!-- MODAL -->
<div class="modal fade" id="modalEdit" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Evento</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <form role="form" method="POST" action="{{ route('event.store') }}">
            {{ csrf_field() }}
            <input type="hidden" name="id" id="event-id">
            <div>
              <div class="row">
                <div class='col-sm-12'>
                    <div class="form-group">
                      <label for="sel1">Medico</label>
                      <input class="form-control" type="text" readonly name="m" value="{{ $user->name }}">
                      <input class="form-control" type="hidden" name="medic" value="{{ $user->id }}">
                      <input class="form-control" type="hidden" name="client" value="{{ $user->id }}">
                      <input class="form-control" type="hidden" name="spec" value="{{ $spec->id }}">
                      <input class="form-control" type="hidden" name="user_is" value="medic">
                      <input class="form-control" type="hidden" name="status" value="3">
                    </div>
                  </div>
                    @input([
                      'type' : 'text',
                      'col' : 12,
                      'name' : 'title',
                      'title' : 'Titulo',
                      'max' : 100,
                      'min' :  2
                    ])
                    @textarea([
                      'type' : 'text',
                      'col' : 12,
                      'name' : 'description',
                      'title' : 'Descripción',
                      'max' : 100,
                      'min' :  2,
                      'row' : 3
                    ])
                    @input([
                      'type' : 'text',
                      'col' : 6,
                      'name' : 'date_start',
                      'readonly': 'true',
                      'title' : 'Inicio',
                      'icon' : 'fa fa-calendar'
                    ])
                    @input([
                      'type' : 'text',
                      'col' : 6,
                      'name' : 'date_end',
                      'readonly': 'true',
                      'title' : 'Fin',
                      'icon' : 'fa fa-calendar'
                     ])
                      <div class="col-md-12">
                        <div class="form-group">
                          <button type="submit" class="btn btn-primary">
                              Guardar
                          </button>
                        </div>
                      </div>
                  </div>
              </div>
        </form>
      </div>
      <!-- <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary">Send message</button>
      </div> -->
    </div>
  </div>
</div>
<!-- END MODAL -->

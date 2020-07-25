<div class="modal-dialog modal-lg">
    <div class="modal-content">
        <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-hidden="true"><i class="fa fa-2x">&times;</i>
            </button>
            <h4 class="modal-title" id="myModalLabel">Recieve Purchase</h4>
        </div>
        <div class="modal-body">
            <div class="table-responsive">
            <?php echo form_open('admin/purchases/purchase_recieve/'.$purchase_id, 'id="action-form"'); ?>
                <div class="form-group">
                    <?= lang("Receive No", "reference"); ?>
                    <?= form_input('receive_no',$receive_no, 'class="form-control receive_no" readonly required id="receive_no"'); ?>
                </div>
                 <div class="form-group">
                    <?= lang("reference", "reference"); ?>
                    <?= form_input('ref_no',$pu->reference_no, 'class="form-control ref_no"  required id="ref_no"'); ?>
                </div>
                 <div class="form-group">
                    <?= lang("Date", "Date"); ?>
                    <?= form_input('date','', 'class="form-control  input-tip datetime"  readonly required id="date"'); ?>
                </div>
                 <div class="form-group">
                    <?= lang("Invoice No", "reference"); ?>
                    <?= form_input('inv_no','', 'class="form-control inv_no" id="inv_no"'); ?>
                </div>
                <table id="CompTable" class="table table-bordered table-hover table-striped">
                    <thead>
                    <tr>
                        <th style="width:30%;">Description (Code)</th>
                        <th style="width:15%;">Order Quantity</th>
                        <th style="width:15%;">Recieved</th>
                        <th style="width:15%;">Unit Cost</th>
                        
                        <th style="width:15%;">Recieve Quantity</th>
                        <th style="width:15%;">Amount Receive</th>
                        <th style="width:15%;">Total Amount</th>
                    </tr>
                    </thead>
                    <tbody>
                        <?php 
                            $amt_total=0;
                            $rcv_total=0;
                            $amount=0;
                            if($pu->status!='received'){
                                 foreach ($rows as $row) {
                                    $data=$this->db->query("SELECT sum(id.quantity) as total FROM sma_purchase_receive i INNER JOIN sma_purchase_receive_item id ON(i.receive_id=id.receive_id) WHERE i.purchase_id='$purchase_id' AND id.item_id='$row->product_id'")->row();

                                    if($row->quantity-$data->total>0){
                                        echo "<tr>
                                                <td>".$row->product_name . " (" . $row->product_code . ")" . ($row->variant ? ' (' . $row->variant . ')' : '')."</td>
                                                <td><input type='hidden' name='recieved[]' class='form-control' value='".$data->total."'/>
                                                    <input type='hidden' name='item_id[]' class='form-control' value='".$row->product_id."'/>
                                                    <input type='hidden' name='pu_itemid[]' class='form-control' value='".$row->id."'/>
                                                    <input type='hidden' name='qty[]' class='form-control' value='".$row->quantity."'/><span class='total'>".$this->sma->formatNumber($row->quantity)."</span></td>
                                                    <td class='recieved'>".$this->sma->formatNumber($data->total)."</td>
                                                    <td>".$this->sma->formatMoney($row->net_unit_cost)."</td>
                                                    <td><input type='text' onkeypress='return isNumberKey(event)' onblur='calculate(event);' name='recieve_q[]' class='form-control' value='".($row->quantity-$data->total)."'/></td>
                                                    <td>".$this->sma->formatMoney($row->net_unit_cost*($row->quantity-$data->total))."</td>
                                                    <td>".$this->sma->formatMoney($row->net_unit_cost*$row->quantity)."</td>
                                            </tr>";
                                    }
                                      
                                    }
                            }
                           
                        ?>
                        
                    </tbody>
                    <tfoot>
                       
                    </tfoot>
                </table>
                <div class="pull-right">
                    <!-- <input type="hidden" class="btn btn-primary" name="form_action" value="" id="form_action"/> -->
                    <?= form_submit('recieve', 'Recieve', 'id="action-form-submit" class="btn btn-primary"') ?>
                </div>
                
                <?= form_close() ?> 
                <p style="clear: both;"></p>
                <div class="table-respondsive ">
                    <table class="table table-bordered table-striped">
                        <head>
                            <th>No</th>
                            <th>Ref No</th>
                            <th>Invoice No</th>
                            <th>Date</th>
                            <th>Recieved by</th>
                            <th>Detail</th>
                        </head>
                        <body>
                            <?php 
                                $i=1;
                                foreach ($recieve as $row) {
                                    echo "<tr>
                                        <td>$i</td>
                                        <td>$row->ref_no</td>
                                        <td>$row->invoice_no</td>
                                        <td>$row->recieve_date</td>
                                        <td>$row->by</td>
                                        <td><a href='".site_url('purchases/view_receive/'.$row->recieve_id)."'>View</a></td>
                                    </tr>";# code...
                                    $i++;
                                }
                             ?>
                        </body>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>
<script src="<?php echo base_url('update/js/bootstrap-datepicker1.js')?>"></script> 
<script src="<?php echo base_url('updatepos/js/jquery.PrintArea.js')?>"></script>  
<script src="<?php echo base_url('updatepos/js/gScript.js')?>"></script>  
<script type="text/javascript" charset="UTF-8">
    $("#date").datepicker({
            language: 'en',
            pick12HourFormat: true,
            format:'yyyy-mm-dd'
        });
    $(document).ready(function () {
        $(document).on('click', '.po-delete', function () {
            var id = $(this).attr('id');
            $(this).closest('tr').remove();
        });
    });
    function isNumberKey(evt){
        var e = window.event || evt; // for trans-browser compatibility 
        var charCode = e.which || e.keyCode; 
        if ((charCode > 45 && charCode < 58) || charCode == 8){ 
            return true; 
        } 
        return false;  
    }
    function calculate(event){
        var total=$(event.target).closest('tr').find('.total').text();
        var recieved=$(event.target).closest('tr').find('.recieved').text();
        var value=Number(total)-Number(recieved);
        var value_input=$(event.target).val();
        if(Number(value_input)>Number(value)){
            alert('Please check your quantity again.');
            $(event.target).val('0.00');
        }
    }
</script>    
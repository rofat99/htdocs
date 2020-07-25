<div class="col-sm-12">
    <div class="row">
        <div class="col-sm-4 pull-left">
            <span class="top_action_button">
                 <a href="JavaScript:void(0);" id="print_inv" class="print_inv btn btn-warning" title="Print">
                    Print<!-- <img src="<?php echo base_url('updatepos/img/pn.png')?>" /> -->
                </a>
                <a href="JavaScript:void(0);" id="export_inv" class="export_inv btn btn-warning" title="Export">
                    Export Exel<!-- <img src="<?php echo base_url('updatepos/img/pn.png')?>" /> -->
                </a>
            </span>
        </div>
    </div>
    <div class="row">
        <div style="text-align: right;" class="col-sm-12">
              <form action="<?php echo site_url('admin/reports/customerCashCredit')?>" method="get" role="form" class="form-inline">
                    <div class="form-group">
                        <label for="email">Payment Method</label>
                            <?php 
                                $ar = array('Cash'=>'Cash','Credit'=>'Credit');
                                echo form_dropdown('ca_cre',$ar,(isset($_GET['ca_cre'])?$_GET['ca_cre'] : ''),'class="form_control ca_cre" id="ca_cre"');
                            ?>
                    </div>
                    <div class="form-group">
                        <label for="email">Customer</label>
                        <select class="form-control customer_id" name="customer_id">
                            <?php 
                                foreach ($pway as $row) {
                                    $sel = '';
                                    if($customer_id == $row->code){
                                        $sel ='selected';
                                    }
                                    echo "<option value='$row->code' $sel>$row->name ($row->code)</option>";
                                }
                            ?>
                        </select>
                    </div>
                     <div class="form-group">
                        <label for="email">Date From</label>
                         <div data-date-format="yyyy-mm-dd" class="input-group input-append">
                            <span class="input-group-addon add-on"><span class="fa fa-calendar"></span></span>
                            <input type="text" style="width: 120px;" value="<?php echo $first_date ?>" id="last_date" name="first_date" value="" class="form-control b_date">
                            
                        </div>
                    </div>
                    <div class="form-group eventForm">
                        <label for="pwd"> Date To </label>
                        <div data-date-format="yyyy-mm-dd" class="input-group input-append">
                            <span class="input-group-addon add-on"><span class="fa fa-calendar"></span></span>
                            <input type="text" style="width: 120px;" value="<?php echo $last_date ?>" id="last_date" name="last_date" value="" class="form-control e_date">
                            
                        </div>
                    </div>
                    
                    <div class="form-group">
                        <input type="submit" value="Search" class="btn btn-info">
                    </div>
                    
              </form>

        </div>
    </div>
</div>
<div style="clear: both"></div>
<div class="col-sm-12" id="inv_print" style="padding-top:20px;">
   
    <div class="header" style="height: 100px; width: 100%;">
        <div class="row" style="padding-left: 15px; padding-right: 15px;">
            <div class="col-sm-12">
                <div class="row">
                   
                    <div class="col-sm-4">
                        <!-- <img src="<?php echo base_url();?>updatepos/img/kpg.png"> -->
                    </div>
                    <div class="col-sm-4" style="text-align: center; padding-bottom: 10px; margin-top: 30px; font-family: Khmer OS Muol; font-size: 20px;">របាយការណ៍ការបង់ប្រាក់របស់អតិថិជន</div>
                    <?php 
                        echo '<div class="col-sm-12" style="text-align: center; font-size:14px;">របាយការណ៍ចាប់ពីថ្ងៃ '.date_format(date_create($first_date),'d-M-Y').' ដល់ '.date_format(date_create($last_date),'d-M-Y').'</div>';
                     ?>
                    
                </div>
            </div>
        </div>
    </div>
    <p style="clear: both"></p>
    <br>
	<table class="table table-bordered table-striped" style=" border-left: none;">
	    <thead>
	      <tr>
            <th>Customer Name</th>
            <th>Referebce Code</th>
            <th>Product Name</th> 
            <th>Quantity</th>
            <th>Price</th>
            <th>Amount</th>
	      </tr>
	    </thead>
	    <tbody>
          <?php 
                $i=0;
                $p_cost=array();
                foreach ($cus_c_c as $spo) {
                    $total_spoiled_qty = $spo->tqty;
                    $total_spoiled_amount = $spo->stotal;

                    $ftotal_qty += $total_spoiled_qty;
                    $ftotal_am += $total_spoiled_amount;

                    
                   
                  ?>
        	      <tr>
                       <td ><?php echo $spo->cname;?></td>
        	           <td ><?php echo $spo->reference_no;?></td>
                       <td ><?php echo $spo->product_name;?></td>
                       <td style="text-align: center;"><?php echo number_format($spo->tqty,2);?></td>

                       <td class="text-right"><?php echo number_format($spo->net_unit_price,2);?></td>
        	           <td class="text-right"><?php echo '$ '.number_format($spo->stotal,2);?></td>
        	      </tr>
                  
          <?php 
            $i++;   }
          ?>
          <tr>
            <th class="text-right" colspan="3" style="background-color:#89bfe5 !important;">REPORT TOTAL</th>
            <th class="text-center"><?php echo number_format($ftotal_qty,2);?></th>
            <th></th>
            <th class="text-right" colspan="2" style="color:#ff0000 !important;"><?php echo '$ '.number_format($ftotal_am,2);?></th>
          </tr>
	      
	    </tbody>
	</table>
</div>

<script src="<?php echo site_url('update/js/bootstrap-datepicker1.js')?>"></script> 
<!-- <script src="<?php echo site_url('updatepos/js/jquery.PrintArea.js')?>"></script>  
<script src="<?php echo site_url('updatepos/js/gScript.js')?>"></script>   -->
<script src="<?php echo base_url('update/js/jquery.PrintArea.js')?>"></script>  
<script src="<?php echo base_url('update/js/gScript.js')?>"></script>
<script type="text/javascript">
    
 $(".b_date,.e_date").datepicker({
            language: 'en',
            pick12HourFormat: true,
            format:'yyyy-mm-dd'
        });

 $(function(){
            $("#print_inv").on("click", function(){
                var export_data = $("#inv_print").html();
                    export_data +='<style type="text/css">'+
                                    'td,th,h5,h6,h2,h3,p,h1,div,span,label{'+
                                        'font-family: Cambria;'+
                                    '}'+
                                    'th{'+
                                        'font-size: 11px;'+
                                        'font-weight: bold;'+
                                    '}'+
                                    'td{'+
                                        'font-size: 11px;'+
                                    '}'+
                                '</style>';
                var title = "";
                gsPrint(title,export_data);
            });
             $("#export_inv").on("click", function(e){
                     var export_data = $("#inv_print").html();
                    export_data +='<style type="text/css">'+
                                    'td,th,h5,h6,h2,h3,p,h1,div,span,label{'+
                                        'font-family: Cambria;'+
                                    '}'+
                                    'th{'+
                                        'font-size: 11px;'+
                                        'font-weight: bold;'+
                                    '}'+
                                    'td{'+
                                        'font-size: 11px;'+
                                    '}'+
                                '</style>';
                        window.open('data:application/vnd.ms-excel,' + encodeURIComponent(export_data));
                        e.preventDefault();
            });
             $('.ca_cre').change(function(){
                var id = $(this).val();
                // alert(id);
                $.ajax({
                    type: "get", 
                    async:false,
                    url: "<?= site_url('admin/reports/get_customerPayment') ?>/" + id,
                    dataType: "json",
                    success: function (scdata) {
                        // console.log(scdata);
                        var d="<option value=''>All Customer</option>";
                        if (scdata != null) {
                            for(var i=0;i<scdata.length;i++){
                                    d+="<option value='"+scdata[i].id+"'>"+scdata[i].name+"("+scdata[i].id+")</option>";
                            }
                        }
                        $('select.customer_id').html(d);
                    }
                });
    });
});

</script>
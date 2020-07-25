<div class="col-sm-12">
    <div class="row">
         <div class="col-sm-4 pull-right">
            <span class="top_action_bustton pull-right">
                <a href="JavaScript:void(0);" id="print_inv" class="print_inv btn btn-warning" title="Print">
                    PRINT<!-- <img src="<?php echo base_url('updatepos/img/pn.png')?>" /> -->
                </a>
                <?php 
                    echo form_open_multipart("admin/reports/exports?stock=$warehouse_id&cateogry=$cate_id&scateogry=$scate_id&first_date=$fdate&last_date=$tdate", 'class="form-inline" method="POST"' );

                 ?>
                   
                    <input type="submit" class="btn btn-warning" value="EXPORT">
              </form>

            </span> 
        </div>
        <div style="text-align: left;" class="col-sm-12 pull-left">
        <?php   //print_r($scate); //$attrib = array('data-toggle' => 'validator', 'role' => 'form','class="form-inline"');
                echo form_open_multipart("admin/reports/filter_stock_report", 'class="form-inline"') ?>
              <!-- <form action="<?php echo site_url('reports/stock_report') ?>" enctype='multipart/form-data' method="post" role="form" class="form-inline"> -->
                    <div class="form-group">
                        <label for="email">Warehouse</label><br>
                        <select class="form-control" name="stock" style="width:200px">
                            <option value=''>All stock</option>
                            <?php 
                            $wh_name=' All Warehouses';
                                foreach ($warehouse as $ware) {
                                    $se='';
                                    if($warehouse_id==$ware->id){
                                        $se="selected";
                                        $wh_name = $ware->name;
                                    }
                                    echo '<option value="'.$ware->id.'" '.$se.'>'.$ware->name.'</optiom>';
                                }
                            ?>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="email">Category</label><br>
                        <select class="form-control" name="cateogry" id="category" style="width:200px">
                            <option value=''>All Category</option>
                            <?php 
                            $cate_name=' All category';
                                foreach ($cate as $ware) {
                                    $se='';
                                    if($cate_id==$ware->id){
                                        $se="selected";
                                        $cate_name = $ware->name;

                                    }
                                    echo '<option value="'.$ware->id.'" '.$se.'>'.$ware->name.'</optiom>';
                                }
                            ?>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="email">Sub-Category</label><br>
                        <select class="form-control" name="scateogry" id="scategory" style="width:200px">
                            <option value=''>All Sub-Category</option>
                            <?php 
                            $scate_name=' All Subcategory';
                                foreach ($scate as $ware) {
                                    $se='';
                                    if($scate_id==$ware->id){
                                        $se="selected";
                                        $scate_name = $ware->name;

                                    }
                                    echo '<option value="'.$ware->id.'" '.$se.'>'.$ware->name.'</optiom>';
                                }
                            ?>
                        </select>
                    </div>
                    
                    <div class="form-group">
                        <label for="email">From</label><br>
                         <div data-date-format="yyyy-mm-dd" class="input-group input-append">
                            <span class="input-group-addon add-on"><span class="fa fa-calendar"></span></span>
                            <input type="text" style="width: 120px;" id="last_date" name="first_date" value="<?php echo $fdate; ?>" class="form-control b_date">
                            
                        </div>
                    </div>
                    <div class="form-group eventForm">
                        <label for="pwd"> To  </label><br>
                        <div data-date-format="yyyy-mm-dd" class="input-group input-append">
                            <span class="input-group-addon add-on"><span class="fa fa-calendar"></span></span>
                            <input type="text" style="width: 120px;" id="last_date" name="last_date" value="<?php echo $tdate; ?>" class="form-control e_date">
                            
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="email"></label><br>

                        <input type="submit" value="Search" class="btn btn-info">
                    </div>
                    
              </form>

        </div>
    </div>
</div>

<div class="col-sm-12" id="inv_print" style="padding-top:20px;">
 <div class="header" style="height: 100px; width: 100%;">
        <div class="row" style="padding-left: 15px; padding-right: 15px;">
            <div class="col-sm-12">
                <div class="row">
                   
                    <div class="col-sm-4">
                        <!-- <img src="<?php echo base_url();?>updatepos/img/kpg.png"> -->
                    </div>
                    <div class="col-sm-4" style="text-align: center; padding-bottom: 10px; margin-top: 30px; font-family: Khmer OS Muol; font-size: 20px;">STOCK REPORTS</div>
                    <?php 
                        if($warehouse_id!=''){
                            // $row=$this->db->where('id',$where_id)->get('warehouses')->row();
                            echo '<div class="col-sm-12" style="text-align: center; font-size:14px;">WAREHOUSE : '.$wh_name.'</div>';
                        }
                            echo '<div class="col-sm-6">';
                            echo '<div class="col-sm-12 pull-left" style="text-align: left; font-size:14px;"><label>Date : '.$fdate.' To '.$tdate.'</label></div>';
                            echo '<div class="col-sm-12 pull-left" style="text-align: left; font-size:14px;"><label>Print Date : '.date('Y-m-d H:i:s').'</label></div>';
                            echo '<div class="col-sm-12 pull-left" style="text-align: left; font-size:14px;"><label>Print By : '.$this->session->userdata('username').'</label></div>';
                            echo '</div><div class="col-sm-6">';
                             
                             echo '<div class="col-sm-12 pull-right" style="text-align: right; font-size:14px;"><label>Category : '.$cate_name.'</label></div>';
                            echo '<div class="col-sm-12 pull-right" style="text-align: right; font-size:14px;"><label>Subcategory: '.$scate_name.'</label></div>';
                            echo '</div>';
                            

                     ?>
                    
                </div>
            </div>
        </div>
    </div>
    <p style="clear: both"></p>
    <br>
	<table class="table table-bordered table-striped">
	    <thead>
	      <tr>
            <th>No</th> <th>Barcode</th>
            <th>SKU</th>
            <!-- <th>Shipment No</th> -->
            <th>Category</th>
            <th>Product Line</th>
           
            <th>Description</th>
	        <th>Beg. BL</th>
	        <th>Stock-in</th>
	        <th>Stock-out</th>
	        <th>End. BL</th>
            <?php if($this->session->userdata('show_cost') || $Owner || $Admin) { ?>

                <th>Cost</th>
            <?php } ?>

	        <th>Price</th>
            <?php if($this->session->userdata('show_cost') ||  $Owner || $Admin) { ?>
                <th>Total-cost</th>
            <?php } ?>
	        <th>Total-price</th>
	      </tr>
	    </thead>
	    <tbody>
	   		<?php 
            $i=0;
            // $total_unit=0;
            $total_stock=0;
            $total_order=0;
            $total_sale=0;
            $total_amount=0;
            $total_cost=0;
            $total_price=0;
            // print_r($stock); die();
	   			foreach ($stock as $s) {
                        $s->price = isset($s->wh_price)?$s->wh_price : $s->price;
                        $quantity = $s->p_total - $s->s_total;
                        // // if(date('Y-m-d',strtotime("$fdate -1 days"))!=date('Y-m-d')){
                        // //     $quantity=$this->site->getproductquantity($s->id,date('Y-m-d',strtotime("$fdate -1 days")),$warehouse_id);
                        // // }
                        // $cost=$this->site->getcost($s->id,$tdate,$warehouse_id);
                        // echo $warehouse_id; die();
                        $cost = $s->my_cost;
                        
                        $total_stock += $quantity;
                       
                        $total_cost+=$cost * ($quantity+$s->total_po-$s->total_sale);
                        $total_price+=$s->price * ($quantity+$s->total_po-$s->total_sale);
                        $avail = $quantity+$s->total_po-$s->total_sale;
                        $i++;
                        $stock_in=$s->total_po;
                        $stock_out=$s->total_sale;
                        if($stock_in<0){
                            $stock_out-=$stock_in;

                            $stock_in=0;
                        }
                        if($stock_out<0){
                            $stock_in-=$stock_out;

                            $stock_out=0;
                        }
                        $total_order += $stock_in;
                        $total_sale += $stock_out;
                    // echo $s->name.'</br>';
            	   		?>
            		      <tr>
                            <td class="text-left"><?php echo $i;?></td>
                             <td class="text-left"><?php echo $s->code;?></td>
                            <td class="text-left"><?php echo $s->sku;?></td>
                            <td class="text-left"><?php echo $s->cate_name;?></td>
                            <td class="text-left"><?php echo $s->scate_name;?></td>
                            <td class="text-left"><?php echo $s->name;?></td>
                            <td class="text-center"><?php echo number_format($quantity,2);?></td>
                            
                            <td class="text-right"><?php echo number_format($stock_in,2);?></td>
            		        <td class="text-right"><?php echo number_format($stock_out,2);?></td>
            		        <td class="text-center"><?php echo number_format($quantity+$s->total_po-$s->total_sale,2);?></td>
                            <?php if($this->session->userdata('show_cost') || $Owner || $Admin) { ?>

            		        <td class="text-right"><?php echo number_format($cost,2);?></td>
                             <?php } ?>

            		        <td class="text-right"><?php echo number_format($s->price,2);?></td>
                            <?php if($this->session->userdata('show_cost') ||  $Owner || $Admin) { ?>

                             <td class="text-right"><?php echo number_format($cost * $avail,2);?></td>
                             <?php } ?>

                            <td class="text-right"><?php echo number_format($s->price * $avail,2);?></td>
            		      </tr>
		    <?php 
                    // }
		    	}
		    ?>
              <tr>
                <th class="text-center"><labe>Total</labe></th>
                <th class="text-left"></th>
                <th class="text-center"></th>
                <th class="text-center"></th>
                <th class="text-center"></th>
                <th class="text-center"></th>
                <th class="text-right"><labe><?php echo number_format($total_stock,2)?></labe></th>

                <th class="text-right"><labe><?php echo number_format($total_order,2)?></labe></th>
                <th class="text-right"><labe><?php echo number_format($total_sale,2)?></labe></th>
                <th class="text-right"><labe><?php echo number_format($total_stock+$total_order-$total_sale,2)?></labe></th>
                <th class="text-center"></th>
            <?php if($this->session->userdata('show_cost') ||  $Owner || $Admin) { ?>
                
                <th class="text-center"></th>

                <th class="text-right"><labe><?php echo number_format($total_cost,2)?></labe></th>
            <?php } ?>

                <th class="text-right"><labe><?php echo number_format($total_price,2)?></labe></th>
              </tr>
	    </tbody>
	</table>
</div>

<script src="<?php echo base_url('update/js/bootstrap-datepicker1.js')?>"></script> 
<script src="<?php echo base_url('updatepos/js/jquery.PrintArea.js')?>"></script>  
<script src="<?php echo base_url('updatepos/js/gScript.js')?>"></script>  
<script type="text/javascript">
    
 $(".b_date,.e_date").datepicker({
            language: 'en',
            pick12HourFormat: true,
            format:'yyyy-mm-dd'
        });

 $(function(){
    // TableExport(document.getElementsByTagName("table"));

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
    
    $('.search_stock').change(function(){
        var id = $(this).val();
        window.location.href = "<?php echo site_url('reports/stock_report')?>"+"/"+id;
    });
    $('#category').change(function(){
        var id = $(this).val();
        $.ajax({
            type: "get", async: false,
            url: "<?= site_url('products/getSubCategories') ?>/" + id,
            dataType: "json",
            success: function (scdata) {
                var d="<option value=''>All Sub-Category</option>";
                if (scdata != null) {
                    for(var i=0;i<scdata.length;i++){
                        // if(scdata[i].id!=undefined){
                            d+="<option value='"+scdata[i].id+"'>"+scdata[i].text+"</option>";

                        // }
                    }
                }
                $('#scategory').html(d);
            }
        });
    });

});

</script>
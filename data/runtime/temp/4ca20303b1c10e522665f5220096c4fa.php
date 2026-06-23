<?php /*a:1:{s:76:"/www/wwwroot/cloud.hf.pw2/public/themes/clientarea/ogmiao/includes/renew.tpl";i:1719999923;}*/ ?>

<div  class="modal fade renew" id="modalRenew" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title mt-0" id="myLargeModalLabel">立即续费</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form method="post" action="/servicedetail?id=<?php echo app('request')->get('id'); ?>&action=renew"><input type="hidden" name="token" value="<?php echo $Token; ?>">
                    <input type="hidden" value="<?php echo $Token; ?>" />
                    <div class="form-group row mb-4">
                        <label class="col-sm-2 col-form-label text-right">付款周期</label>
                        <div class="col-sm-9 d-flex align-items-center">
                            <div class=" btn-group btn-group-toggle  mt-xl-0" data-toggle="buttons">
                                <?php foreach($Renew['cycle'] as $key=>$item): ?>
                                    <label class="btn btn-primary <?php if($key==0): ?>active<?php endif; ?> btn-radio-bill" data-billingcycle="<?php echo $item['billingcycle_zh']; ?>"
                                           data-amount="<?php echo $item['amount']; ?>" data-billingcycleId="<?php echo $item['billingcycle']; ?>">
                                        <input type="radio" name="billingcycles" value="<?php echo $item['billingcycle']; ?>" <?php if($key==0): ?>checked<?php endif; ?>><?php echo $item['billingcycle_zh']; ?>
                                    </label>
                                <?php endforeach; ?>
                            </div>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-2 col-form-label text-right">金额</label>
                        <div class="col-sm-9 d-flex align-items-baseline">
 
                        <span class="text-primary font-size-24 mr-2">
                          <?php echo $Renew['currency']['prefix']; ?>
                          <span id="cycle-amount"><?php echo $Renew['cycle'][0]['amount']; ?></span>
                        </span>
                            <?php echo $Renew['currency']['suffix']; ?>/
                            <span id="billingcycle" data-billingcycleId="<?php echo $Renew['cycle'][0]['billingcycle']; ?>"><?php echo $Renew['cycle'][0]['billingcycle_zh']; ?></span>
                        </div>
                    </div>
                    <div class="form-group row">
                        <div class="offset-sm-2 col-sm-8">
                            <button class="btn btn-primary rightBill" >立即续费</button>
                        </div>
                    </div>
                </form>

            </div>
        </div>
    </div>
</div>


<script>
    $(function(){
        $('.btn-radio-bill').click(function(){
            var cycleAmount = $(this).data('amount')
            var billingcycle = $(this).data('billingcycle')
            var billingcycleId = $(this).data('billingcycleId')
            $('#cycle-amount').text(cycleAmount)
            $('#billingcycle').text(billingcycle)
            $('#billingcycle').data('billingcycleId',billingcycleId)
        })
    })
</script>



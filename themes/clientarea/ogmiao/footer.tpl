{if $TplName != 'login' && $TplName != 'register' && $TplName != 'pwreset' && $TplName != 'bind' && $TplName != 'loginaccesstoken' }
</div>
</div>
</div>

{/if}

<script src="/themes/clientarea/default/assets/js/app.js?v={$Ver}"></script>
{php}$hooks=hook('client_area_footer_output');{/php}
{if $hooks}
	{foreach $hooks as $item}
		{$item}
	{/foreach}
{/if}

{if $CustomDepot.yangcube_showhitokoto == "true"}
<script>
fetch('{if $CustomDepot.yangcube_hitokotoapi}{$CustomDepot.yangcube_hitokotoapi}{else}https://v1.hitokoto.cn/{/if}')
.then(response => response.json())
.then(data => {
  const hitokoto = document.getElementById('hitokoto_text')
  if (!hitokoto) return
  hitokoto.href = 'https://hitokoto.cn/?uuid=' + data.uuid
  hitokoto.innerText = "【Hitokoto 一言】" + data.hitokoto
})
.catch(console.error)
</script>
{/if}
</body>

</html>

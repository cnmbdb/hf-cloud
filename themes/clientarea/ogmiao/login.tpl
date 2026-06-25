{if $ErrorMsg}
{include file="error/alert" value="$ErrorMsg"}
{/if}

{if $SuccessMsg}
{include file="error/notifications" value="$SuccessMsg"}
{/if}

<script src="/themes/clientarea/default/assets/js/crypto-js.min.js" type="text/javascript"></script>
<script src="/themes/clientarea/default/assets/js/public.js" type="text/javascript"></script>

<style>
	:root {
		--og-background: #000000;
		--og-foreground: #fafafa;
		--og-card: #0a0a0a;
		--og-card-foreground: #fafafa;
		--og-popover: #0a0a0a;
		--og-popover-foreground: #fafafa;
		--og-primary: #fafafa;
		--og-primary-foreground: #0a0a0a;
		--og-secondary: #171717;
		--og-secondary-foreground: #fafafa;
		--og-muted: #171717;
		--og-muted-foreground: #a3a3a3;
		--og-accent: #262626;
		--og-accent-foreground: #fafafa;
		--og-border: #262626;
		--og-input: #262626;
		--og-ring: #fafafa;
		--og-radius: 8px;
	}

	html,
	body,
	.auth-wrapper {
		background: var(--og-background) !important;
		color: var(--og-foreground);
	}

	body {
		font-family: "Poppins", "PingFang SC", "Microsoft YaHei", ui-sans-serif, system-ui, -apple-system, sans-serif !important;
	}

	.auth-wrapper {
		min-height: 100vh;
		display: grid;
		place-items: center;
		padding: 40px 20px;
		position: relative;
		overflow: hidden;
	}

	.auth-shell {
		width: min(100%, 430px);
		display: grid;
		grid-template-columns: 1fr;
		align-items: center;
		position: relative;
		z-index: 1;
	}

	.auth-card {
		width: 100%;
		border: 1px solid var(--og-border);
		border-radius: calc(var(--og-radius) + 4px);
		background: var(--og-card);
		box-shadow: 0 24px 80px rgba(0,0,0,.5);
		transform-style: preserve-3d;
	}

	.auth-card-header {
		padding: 28px 28px 0;
	}

	.auth-card-title {
		margin: 0;
		color: var(--og-card-foreground);
		font-size: 24px;
		line-height: 1.2;
		font-weight: 600;
	}

	.auth-card-description {
		margin: 9px 0 0;
		color: var(--og-muted-foreground);
		font-size: 14px;
		line-height: 1.7;
	}

	.auth-card-content {
		padding: 24px 28px 28px;
	}

	.auth-tabs {
		display: grid;
		grid-auto-flow: column;
		grid-auto-columns: 1fr;
		gap: 4px;
		margin: 0 0 24px;
		padding: 4px;
		border: 1px solid var(--og-border);
		border-radius: var(--og-radius);
		background: var(--og-muted);
		list-style: none;
	}

	.auth-tabs .nav-item {
		min-width: 0;
	}

	.auth-tabs .nav-link {
		min-height: 36px;
		display: inline-flex;
		align-items: center;
		justify-content: center;
		width: 100%;
		padding: 8px 10px;
		border: 0 !important;
		border-radius: 6px !important;
		background: transparent !important;
		color: var(--og-muted-foreground) !important;
		font-size: 14px;
		font-weight: 500;
		text-decoration: none;
	}

	.auth-tabs .nav-link.active,
	.auth-tabs .nav-link:hover {
		background: var(--og-background) !important;
		color: var(--og-foreground) !important;
	}

	.auth-card .form-group {
		margin-bottom: 16px;
	}

	.auth-card label {
		margin-bottom: 8px;
		color: var(--og-foreground);
		font-size: 14px;
		font-weight: 500;
	}

	.auth-card .form-control {
		height: 42px;
		border: 1px solid var(--og-input) !important;
		border-radius: 6px !important;
		background: transparent !important;
		color: var(--og-foreground) !important;
		box-shadow: none !important;
		font-size: 14px;
	}

	.auth-card .form-control:focus {
		border-color: var(--og-ring) !important;
		box-shadow: 0 0 0 2px rgba(250,250,250,.16) !important;
	}

	.auth-card .form-control::placeholder {
		color: #737373;
	}

	.auth-card .input-group-prepend {
		width: 104px;
	}

	.auth-card .input-group-prepend .form-control {
		border-top-right-radius: 0 !important;
		border-bottom-right-radius: 0 !important;
	}

	.auth-card .input-group > .form-control:not(:first-child) {
		border-top-left-radius: 0 !important;
		border-bottom-left-radius: 0 !important;
	}

	.auth-card .input-group-append {
		height: 42px;
	}

	.auth-card .input-group-append .btn,
	.auth-card .input-group-append img {
		height: 42px !important;
		border-radius: 0 6px 6px 0 !important;
	}

	.auth-card .input-group-append img {
		border: 1px solid var(--og-border) !important;
		background: #fff;
		object-fit: cover;
	}

	.auth-card .btn {
		min-height: 42px;
		border-radius: 6px !important;
		font-size: 14px;
		font-weight: 500;
		box-shadow: none !important;
	}

	.auth-card .btn-primary {
		border-color: var(--og-primary) !important;
		background: var(--og-primary) !important;
		color: var(--og-primary-foreground) !important;
	}

	.auth-card .btn-primary:hover,
	.auth-card .btn-primary:focus {
		background: #e5e5e5 !important;
		border-color: #e5e5e5 !important;
	}

	.auth-card .btn-secondary,
	.auth-card .btn-outline-light {
		border-color: var(--og-border) !important;
		background: var(--og-secondary) !important;
		color: var(--og-secondary-foreground) !important;
	}

	.auth-actions {
		display: flex;
		align-items: center;
		justify-content: space-between;
		gap: 12px;
		margin-top: 4px;
		color: var(--og-muted-foreground);
		font-size: 14px;
	}

	.auth-actions a,
	.auth-actions .pointer,
	.auth-register a {
		color: var(--og-foreground) !important;
		text-decoration: underline;
		text-underline-offset: 4px;
	}

	.auth-submit {
		margin-top: 18px;
	}

	.auth-oauth {
		margin-top: 24px;
		padding-top: 24px;
		border-top: 1px solid var(--og-border);
		text-align: center;
	}

	.auth-oauth h5 {
		margin: 0 0 14px;
		color: var(--og-muted-foreground);
		font-size: 13px;
		font-weight: 500;
	}

	.auth-oauth .list-inline {
		margin: 0;
	}

	.auth-oauth .list-inline-item .icon {
		width: 2rem;
		height: 2rem;
	}

	.auth-oauth .social-list-item {
		width: 42px;
		height: 42px;
		display: inline-flex;
		align-items: center;
		justify-content: center;
		border: 1px solid var(--og-border);
		border-radius: 6px;
		background: var(--og-secondary);
	}

	.auth-register {
		margin: 24px 0 0;
		color: var(--og-muted-foreground);
		font-size: 14px;
		text-align: center;
	}

	.allow_login_code_captcha {
		display: none;
	}

	.auth-animate-in {
		will-change: transform, opacity;
	}

	.modal-content {
		border: 1px solid var(--og-border);
		border-radius: calc(var(--og-radius) + 4px);
		background: var(--og-card);
		color: var(--og-foreground);
	}

	.modal-header,
	.modal-footer {
		border-color: var(--og-border);
	}

	.modal .close {
		color: var(--og-foreground);
		text-shadow: none;
		opacity: .75;
	}

	@media (max-width: 991.98px) {
		.auth-wrapper {
			padding: 28px 16px;
		}

	}

	@media (max-width: 575.98px) {
		.auth-card-header,
		.auth-card-content {
			padding-left: 18px;
			padding-right: 18px;
		}

		.auth-card-header {
			padding-top: 22px;
		}

		.auth-actions {
			align-items: flex-start;
			flex-direction: column;
		}
	}
</style>
<script type="text/javascript">
	var mk = '{$Setting.msfntk}';
</script>
<script src="https://cdn.jsdelivr.net/npm/gsap@3.12.5/dist/gsap.min.js"></script>

<div class="auth-wrapper">
	<div class="auth-shell">
		<section class="auth-card auth-animate-in">
			<div class="auth-card-header">
				<h2 class="auth-card-title">{$Lang.sign_in}</h2>
				<p class="auth-card-description">{$Lang.please_login}</p>
			</div>
			<div class="auth-card-content">
				<ul class="auth-tabs nav" role="tablist">
					{if $Login.allow_login_phone==1}
					<li class="nav-item">
						<a class="nav-link {if $Get.action=="phone" || $Get.action=="phone_code" || !$Get.action}active{/if}" data-toggle="tab" href="#phone" role="tab" aria-selected="false" id="tab-phone">{$Lang.mobile_login}</a>
					</li>
					{/if}

					{if $Login.allow_login_email==0 && $Login.allow_id==1}
					<li class="nav-item">
						<a class="nav-link {if ($Login.allow_login_phone==0 && $Login.allow_id == 1)}active{/if}" data-toggle="tab" href="#email" role="tab" aria-selected="false" id="tab-email">{$Lang.id_login}</a>
					</li>
					{/if}

					{if $Login.allow_login_email}
					<li class="nav-item">
						<a class="nav-link {if ($Login.allow_login_phone==0 && $Login.allow_login_email == 1  && $Login.allow_id == 0) || $Get.action=="email"}active{/if}" data-toggle="tab" href="#email" role="tab" aria-selected="true" id="tab-email">{$Lang.email_login}</a>
					</li>
					{/if}
				</ul>

				<div class="tab-content">
					{if $Login.allow_login_email || $Login.allow_id}
					<div id="email" class="tab-pane {if ($Login.allow_login_phone==0 && ($Login.allow_login_email == 1  || $Login.allow_id == 1)) || $Get.action=="email"}active{/if}" role="tabpanel">
						<form method="post" action="/login?action=email" onsubmit="return encryptPass('emailPwdInp');">
							<div class="form-group">
								<label for="emailInp">{if $Login.allow_login_email}{$Lang.mailbox}{else}ID{/if}</label>
								<input type="text" class="form-control" id="emailInp" name="email" value="{$Post.email}" placeholder="{$Lang.please_enter_your}{if $Login.allow_login_email}{$Lang.mailbox}{if $Login.allow_id==1}{$Lang.ors}{/if}{/if}{if $Login.allow_id==1}ID{/if}">
							</div>
							<div class="form-group">
								<label for="emailPwdInp">{$Lang.password}</label>
								<input type="password" class="form-control" id="emailPwdInp" name="password" placeholder="{$Lang.please_enter_password}">
							</div>
							{if $Login.allow_login_email_captcha==1 && $Login.is_captcha==1}
							{include file="includes/verify"  type="allow_login_email_captcha" positon="top"}
							{/if}
							<div class="auth-actions">
								<span></span>
								<a href="pwreset">{$Lang.forget_the_password}</a>
							</div>
							<div class="auth-submit">
								{if $Login.second_verify_action_home_login==1}
								<button class="btn btn-primary btn-block d-flex justify-content-center align-items-center" type="button" onclick="loginBefore('email');">{$Lang.sign_in}</button>
								{else/}
								<button class="btn btn-primary btn-block d-flex justify-content-center align-items-center" type="submit">{$Lang.sign_in}</button>
								{/if}
							</div>
						</form>
					</div>
					{/if}

					{if $Login.allow_login_phone}
					<div id="phone" class="tab-pane {if $Get.action=="phone" || $Get.action=="phone_code" || !$Get.action}active{/if}" role="tabpanel">
						<form method="post" action="/login?action=phone" onsubmit="return encryptPass('phonePwdInp');">
							<div class="form-group">
								<label for="phoneInp">{$Lang.phone_number}</label>
								<div class="input-group">
									{if $Login.allow_login_register_sms_global==1}
									<div class="input-group-prepend">
										<select class="form-control select2 select2-hidden-accessible" data-select2-id="1" tabindex="-1" aria-hidden="true" name="phone_code" value="{$Post.phone_code}" id="phoneCodeSel">
											{foreach $SmsCountry as $list}
											<option value="{$list.phone_code}" {if $list.phone_code=="+86"}selected {/if}>{$list.link}</option>
											{/foreach}
										</select>
									</div>
									{/if}
									<input type="text" class="form-control" id="phoneInp" name="phone" value="{$Post.phone}" placeholder="{$Lang.please_enter_your_mobile_phone_number}">
								</div>
							</div>
							<div class="form-group allow_login_phone_captcha">
								<label for="phonePwdInp">{$Lang.password}</label>
								<input type="password" class="form-control" id="phonePwdInp" name="password" placeholder="{$Lang.please_enter_password}">
							</div>
							{if $Login.allow_login_phone_captcha==1 && $Login.is_captcha==1}
							{include file="includes/verify"  type="allow_login_phone_captcha" positon="top"}
							{/if}
							{if $Login.allow_login_code_captcha==1 && $Login.is_captcha==1}
							{include file="includes/verify"  type="allow_login_code_captcha" positon="top"}
							{/if}

							<div class="form-group allow_login_code_captcha">
								<label for="phoneCodeInp">{$Lang.verification_code}</label>
								<div class="input-group">
									<input type="text" class="form-control" id="phoneCodeInp" name="code" value="{$Post.code}" placeholder="{$Lang.please_enter_code}">
									<div class="input-group-append">
										<button class="btn btn-primary" type="button" onclick="getCode(this,'login_send','allow_login_code_captcha')">{$Lang.get_code}</button>
									</div>
								</div>
							</div>

							<div class="auth-actions">
								<div onclick="phoneCheck(this,'allow_login_phone_captcha')" class="pointer" {if $Get.action=="phone_code"} style="display:none;" {/if}>{$Lang.verification_code_login}</div>
								<div onclick="phoneCheck(this,'allow_login_code_captcha')" class="pointer" {if $Get.action!="phone_code"} style="display:none;" {/if}>{$Lang.password_login}</div>
								<a href="pwreset">{$Lang.forget_the_password}</a>
							</div>
							<div class="auth-submit">
								{if $Login.second_verify_action_home_login==1}
								<button class="btn btn-primary btn-block justify-content-center align-items-center allow_login_phone_captcha" type="button" onclick="loginBefore('phone');">{$Lang.sign_in}</button>
								<button class="btn btn-primary btn-block justify-content-center align-items-center allow_login_code_captcha" type="submit">{$Lang.sign_in}</button>
								{else/}
								<button class="btn btn-primary btn-block justify-content-center align-items-center" type="submit">{$Lang.sign_in}</button>
								{/if}
							</div>
						</form>
					</div>
					{/if}
				</div>

				{if $Oauth}
				<div class="auth-oauth">
					<h5>{$Lang.use_other_login}</h5>
					<ul class="list-inline">
						{foreach $Oauth as $list}
						<li class="list-inline-item">
							<a href="{$list.url}" class="social-list-item text-white" target="blank">{$list.img}</a>
						</li>
						{/foreach}
					</ul>
				</div>
				{/if}

				<p class="auth-register">{$Lang.no_account_yet} <a href="register">{$Lang.register_now}</a></p>
			</div>
		</section>
	</div>
</div>

{if $Login.second_verify_action_home_login==1}
<div class="modal fade" id="secondVerifyModal" tabindex="-1" role="dialog" aria-labelledby="secondVerifyModal" aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title">{$Lang.secondary_verification}</h5>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<form>
					<input type="hidden" value="{$Token}" />
					<input type="hidden" value="closed" name="action" />
					<div class="form-group row mb-4">
						<label class="col-sm-3 col-form-label text-right">{$Lang.verification_method}</label>
						<div class="col-sm-8">
							<select class="form-control" class="second_type" name="type" id="secondVerifyType"></select>
						</div>
					</div>
					<div class="form-group row mb-0">
						<label class="col-sm-3 col-form-label text-right">{$Lang.verification_code}</label>
						<div class="col-sm-8">
							<div class="input-group">
								<input type="text" name="code" id="secondVerifyCode" class="form-control" placeholder="{$Lang.please_enter_code}" />
								<div class="input-group-append" id="getCodeBox">
									<button class="btn btn-secondary" type="button" onclick="getCode(this,'login/second_verify_send')">{$Lang.get_code}</button>
								</div>
							</div>
						</div>
					</div>
				</form>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-outline-light" data-dismiss="modal">{$Lang.cancel}</button>
				<button type="button" class="btn btn-primary mr-2" id="secondVerifySubmit">{$Lang.determine}</button>
			</div>
		</div>
	</div>
</div>
{/if}

<script type="text/javascript">
{literal}
document.addEventListener('DOMContentLoaded', function () {
	if (!window.gsap) return;

	var reduceMotion = window.matchMedia && window.matchMedia('(prefers-reduced-motion: reduce)').matches;
	var authCard = document.querySelector('.auth-card');
	var controls = document.querySelectorAll('.auth-card .form-control, .auth-card .btn, .auth-tabs .nav-link, .auth-register a, .auth-actions a, .auth-actions .pointer');

	gsap.defaults({ duration: 0.42, ease: 'power2.out' });

	if (!reduceMotion) {
		gsap.timeline()
			.from(authCard, { autoAlpha: 0, y: 18, scale: 0.985, duration: 0.56 })
			.from('.auth-card-header, .auth-tabs, .tab-pane.active .form-group, .tab-pane.active .auth-actions, .tab-pane.active .auth-submit, .auth-oauth, .auth-register', {
				autoAlpha: 0,
				y: 10,
				stagger: 0.045,
				duration: 0.34
			}, '-=0.24');

		if (authCard) {
			authCard.addEventListener('mouseenter', function () {
				gsap.to(authCard, { y: -4, borderColor: '#3f3f46', duration: 0.26, overwrite: 'auto' });
			});
			authCard.addEventListener('mouseleave', function () {
				gsap.to(authCard, { y: 0, borderColor: '#262626', duration: 0.32, overwrite: 'auto' });
			});
		}
	}

	controls.forEach(function (control) {
		control.addEventListener('mouseenter', function () {
			if (reduceMotion) return;
			gsap.to(control, { y: -1, duration: 0.18, overwrite: 'auto' });
		});
		control.addEventListener('mouseleave', function () {
			if (reduceMotion) return;
			gsap.to(control, { y: 0, duration: 0.2, overwrite: 'auto' });
		});
		control.addEventListener('focus', function () {
			if (reduceMotion) return;
			gsap.to(control, { scale: 1.01, duration: 0.18, overwrite: 'auto' });
		});
		control.addEventListener('blur', function () {
			if (reduceMotion) return;
			gsap.to(control, { scale: 1, duration: 0.18, overwrite: 'auto' });
		});
	});

	if (window.jQuery) {
		jQuery('a[data-toggle="tab"]').on('shown.bs.tab', function (event) {
			if (reduceMotion) return;
			var target = document.querySelector(event.target.getAttribute('href'));
			if (!target) return;
			gsap.fromTo(target.querySelectorAll('.form-group, .auth-actions, .auth-submit'), {
				autoAlpha: 0,
				y: 8
			}, {
				autoAlpha: 1,
				y: 0,
				stagger: 0.04,
				duration: 0.26,
				overwrite: 'auto'
			});
		});
	}
});
{/literal}

{if $Get.action=="phone_code"}
phoneCheck("","allow_login_phone_captcha")
{else/}
phoneCheck("","allow_login_code_captcha")
{/if}
</script>

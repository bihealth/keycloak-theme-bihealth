<#import "template.ftl" as layout>
<@layout.registrationLayout displayMessage=!messagesPerField.existsError('username','password') displayInfo=false; section>
    <#if section = "header">
        ${msg("loginAccountTitle")}
    <#elseif section = "form">
        <div id="kc-form">
            <div id="kc-form-wrapper">
                <div class="custom-sso-text" style="text-align: center; margin-bottom: 2rem;">
                    <p style="font-size: 15px; line-height: 1.5;">
                        <p style="margin-bottom: 1rem;">
                            This is the single sign-on (SSO) Keycloak server hosted by BIH HPC IT/CUBI.
                            <strong>By performing a sign-on, you agree to the following terms.</strong>
                        </p>
                        <p style="margin-bottom: 1rem;">
                            We will store the following information in this system to fulfill the
                            purpose of this server as a single sign-on broker.  Your user name,
                            first name, last name, and email address. No passwords will be received
                            or stored by us at any time.
                        </p>
                        <p style="margin-bottom: 0px;">
                            You can contact us at any time by an email to the following address
                            to have your information removed:
                            <a href="mailto:hpc-helpdesk@bih-charite.de">hpc-helpdesk@bih-charite.de</a>.
                        </p>
                        <hr>
                            <p>Use the following buttons to login with the account from your home organization.</p>
                    </p>
                </div>
            </div>
        </div>
    <#elseif section = "socialProviders">
        <#if social.providers?? && social.providers?has_content>
            <div id="kc-social-providers" class="${properties.kcFormSocialAccountSectionClass!}">
                <ul class="${properties.kcFormSocialAccountListClass!} <#if social.providers?size gt 3>${properties.kcFormSocialAccountListGridClass!}</#if>">
                    <#list social.providers as p>
                        <li>
                            <a data-once-link id="social-${p.alias}" class="${properties.kcFormSocialAccountListButtonClass!} <#if social.providers?size gt 3>${properties.kcFormSocialAccountGridItem!}</#if>" type="button" href="${p.loginUrl}">
                                <#if p.iconClasses?has_content>
                                    <i class="${properties.kcCommonLogoIdP!} ${p.iconClasses!}" aria-hidden="true"></i>
                                    <span class="${properties.kcFormSocialAccountNameClass!} kc-social-icon-text">${p.displayName!}</span>
                                <#else>
                                    <span class="${properties.kcFormSocialAccountNameClass!}">${p.displayName!}</span>
                                </#if>
                            </a>
                        </li>
                    </#list>
                </ul>
            </div>
        <#else>
            <p style="text-align: center; color: red;">No SSO providers are currently configured.</p>
        </#if>
    </#if>

</@layout.registrationLayout>

FROM nginx:1.15.8

COPY nginx.conf  /etc/nginx/conf.d/default.conf

COPY error_page.html /error_page.html
RUN \
    sed -e 's/HTTP_CODE/403/g;s/MESSAGE/Forbidden/g' /error_page.html > /usr/share/nginx/html/403.html && \
    sed -e 's/HTTP_CODE/404/g;s/MESSAGE/Page Not Found/g' /error_page.html > /usr/share/nginx/html/404.html && \
    sed -e 's/HTTP_CODE/500/g;s/MESSAGE/Internal Server Error/g' /error_page.html > /usr/share/nginx/html/500.html && \
    sed -e 's/HTTP_CODE/502/g;s/MESSAGE/Bad Gateway/g' /error_page.html > /usr/share/nginx/html/502.html && \
    sed -e 's/HTTP_CODE/503/g;s/MESSAGE/Service Unavailable/g' /error_page.html > /usr/share/nginx/html/503.html && \
    sed -e 's/HTTP_CODE/504/g;s/MESSAGE/Gateway Timeout/g' /error_page.html > /usr/share/nginx/html/504.html

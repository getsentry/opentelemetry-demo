
BASE_NAME="europe-west3-docker.pkg.dev/sentry-st-testing/public/open-telemetry-demo"
VERSION="v1.0.0"

IMAGES=( cartService checkoutService currencyService emailService featureflagService frontend frontendProxy loadgenerator paymentService productCatalogService recommendationService shippingService quoteService adService)

for DIR_NAME in "${IMAGES[@]}"
do
  #lowercase the directory name to get the tag name for the image
  IMAGE=$(echo "$DIR_NAME" |  tr '[:upper:]' '[:lower:]' )
  IMAGE_NAME=${BASE_NAME}:${VERSION}-${IMAGE}
  echo "Building ${IMAGE} ..."
  docker buildx build  --platform linux/amd64 -f ./src/${DIR_NAME}/Dockerfile -t  ${IMAGE_NAME} .
  echo "Pushing ${IMAGE} to ${IMAGE_NAME} "
  docker push ${IMAGE_NAME}
done



docker buildx build  --platform linux/amd64 -f ./src/adService/Dockerfile -t  europe-west3-docker.pkg.dev/sentry-st-testing/public/open-telemetry-demo:v1.0.0-adservice
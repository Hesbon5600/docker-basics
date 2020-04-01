import json
from django.conf import settings
from rest_framework import mixins, generics
from rest_framework.permissions import IsAuthenticated
from rest_framework.response import Response
from rest_framework import status
from .tasks import test_docker

class DockerAPIView(generics.GenericAPIView):
    def post(self, request):
        data = request.data

        test_docker.delay(data)
        return Response({"message": "Test Docker"}, status=status.HTTP_201_CREATED)


# class ConfirmPaymentAPIView(generics.GenericAPIView):
#     """Handle Mpesa Payment"""
#     swagger_schema = None

#     def post(self, request, transaction_id):
#         """
#         Handle the callback after a transaction
#         """
#         data = request.data
#         print(data['Body'])
#         try:
#             payment = Payment.objects.get(id=transaction_id)
#             if data['Body']['stkCallback']['ResultCode'] == 0:
#                 ref_number = data['Body']['stkCallback']['CallbackMetadata']['Item'][1]['Value']
#                 payment.ref_number = ref_number
#                 payment.status = 'O'
#                 payment.save()
#                 message = "Request is processed successfully"

#             else:
#                 payment.status = 'C'
#                 payment.save()
#                 message = data['Body']['stkCallback']['ResultDesc']
#         except Exception as e:
#             print(e)
#             payment.status = 'C'
#             payment.save()
#             message = data['Body']['stkCallback']['ResultDesc']
#         return Response({"message": message}, status=status.HTTP_200_OK)

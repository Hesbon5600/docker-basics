from app import celery_app
from celery.utils.log import get_task_logger

logger = get_task_logger(__name__)


@celery_app.task(name="test docker")
def test_docker(data):
    logger.info(data)

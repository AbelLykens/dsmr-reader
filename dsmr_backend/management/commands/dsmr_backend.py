import traceback
import logging

from django.core.management.base import BaseCommand
from django.utils.translation import ugettext as _
from django.conf import settings

from dsmr_backend.mixins import InfiniteManagementCommandMixin
import dsmr_backend.signals


logger = logging.getLogger('commands')


class Command(InfiniteManagementCommandMixin, BaseCommand):
    help = _('Generates a generic event triggering apps for backend operations, cron-like.')
    name = __name__  # Required for PID file.
    sleep_time = settings.DSMRREADER_BACKEND_SLEEP

    def run(self, **options):
        """ InfiniteManagementCommandMixin listens to handle() and calls run() in a loop. """
        logger.info('Calling backend services')

        # send_robust() guarantees the every listener receives this signal.
        responses = dsmr_backend.signals.backend_called.send_robust(None)

        for __, current_response in responses:
            if isinstance(current_response, Exception):
                # Add and print traceback to help debugging any issues raised.
                exception_traceback = traceback.format_tb(current_response.__traceback__, limit=100)
                exception_traceback = "\n".join(exception_traceback)
                logger.critical('Uncaught exception: %s', exception_traceback)

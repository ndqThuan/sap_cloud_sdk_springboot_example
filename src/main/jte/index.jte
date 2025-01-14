@import com.citek.sap.cloud.sdk.vdm.namespaces.rfqprocesssrv.RequestForQuotation
@import java.util.List 
@import java.time.format.DateTimeFormatter 
@param List<RequestForQuotation> rfqList

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
      rel="stylesheet"
      integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
      crossorigin="anonymous"
    />
    <title>Request For Quotations</title>
  </head>
  <body x-data="{ slideOverOpen: false }">
    <div class="container-fluid px-5">
      <table class="table stripped">
        <thead>
          <tr>
            <th scope="col">RFQ</th>
            <th scope="col">Currency</th>
            <th scope="col">Deadline</th>
          </tr>
        </thead>
        <tbody>
          @for(RequestForQuotation rfq : rfqList)
          <tr>
            <th scope="row">
              <div class="relative z-50 w-auto h-auto">
                <button
                  @click="slideOverOpen=true"
                  hx-post="/service/rfq?RequestForQuotation=${rfq.getRFQ()}"
                  hx-target="#slideOverOpen_RfqDetail"
                  hx-swapt="innerHTML"
                  class="inline-flex items-center justify-center h-10 px-4 py-2 text-sm font-medium transition-colors bg-white border rounded-md hover:bg-neutral-100 active:bg-white focus:bg-white focus:outline-none focus:ring-2 focus:ring-neutral-200/60 focus:ring-offset-2 disabled:opacity-50 disabled:pointer-events-none"
                >
                  ${rfq.getRFQ()}
                </button>
              </div>
            </th>
            <td>${rfq.getCurrency()}</td>
            <td>
              ${rfq.getQuotationDeadline().format(DateTimeFormatter.ofPattern("dd/MM/yyyy"))}
            </td>
          </tr>
          @endfor
        </tbody>
      </table>
    </div>
    <template x-teleport="body">
      <div
        x-show="slideOverOpen"
        @keydown.window.escape="slideOverOpen=false"
        class="relative z-[99]"
      >
        <div
          x-show="slideOverOpen"
          x-transition.opacity.duration.600ms
          @click="slideOverOpen = false"
          class="fixed inset-0 bg-black bg-opacity-10"
        ></div>
        <div class="fixed inset-0 overflow-hidden">
          <div class="absolute inset-0 overflow-hidden">
            <div class="fixed inset-y-0 right-0 flex max-w-full pl-10">
              <div
                id="slideOverOpen_RfqDetail"
                x-show="slideOverOpen"
                @click.away="slideOverOpen = false"
                x-transition:enter="transform transition ease-in-out duration-500 sm:duration-700"
                x-transition:enter-start="translate-x-full"
                x-transition:enter-end="translate-x-0"
                x-transition:leave="transform transition ease-in-out duration-500 sm:duration-700"
                x-transition:leave-start="translate-x-0"
                x-transition:leave-end="translate-x-full"
                class="w-screen max-w-lg"
              ></div>
            </div>
          </div>
        </div>
      </div>
    </template>
    <script
      src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
      integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
      crossorigin="anonymous"
    ></script>
    <script
      src="https://unpkg.com/htmx.org@2.0.4"
      integrity="sha384-HGfztofotfshcF7+8n44JQL2oJmowVChPTg48S+jvZoztPfvwD79OC/LTtG6dMp+"
      crossorigin="anonymous"
    ></script>
    <script src="https://unpkg.com/alpinejs" defer></script>
    <script src="https://cdn.tailwindcss.com"></script>
  </body>
</html>

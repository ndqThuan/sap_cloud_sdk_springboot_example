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
  <body>
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
              <div
                x-data="{ 
                      slideOverOpen: false 
                  }"
                class="relative z-50 w-auto h-auto"
              >
                <button
                  @click="slideOverOpen=true"
                  class="inline-flex items-center justify-center h-10 px-4 py-2 text-sm font-medium transition-colors bg-white border rounded-md hover:bg-neutral-100 active:bg-white focus:bg-white focus:outline-none focus:ring-2 focus:ring-neutral-200/60 focus:ring-offset-2 disabled:opacity-50 disabled:pointer-events-none"
                >
                  ${rfq.getRFQ()}
                </button>
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
                        <div
                          class="fixed inset-y-0 right-0 flex max-w-full pl-10"
                        >
                          <div
                            x-show="slideOverOpen"
                            @click.away="slideOverOpen = false"
                            x-transition:enter="transform transition ease-in-out duration-500 sm:duration-700"
                            x-transition:enter-start="translate-x-full"
                            x-transition:enter-end="translate-x-0"
                            x-transition:leave="transform transition ease-in-out duration-500 sm:duration-700"
                            x-transition:leave-start="translate-x-0"
                            x-transition:leave-end="translate-x-full"
                            class="w-screen max-w-lg"
                          >
                            <div
                              class="flex flex-col h-full py-5 overflow-y-scroll bg-white border-l shadow-lg border-neutral-100/70"
                            >
                              <div class="px-4 sm:px-5">
                                <div
                                  class="flex items-start justify-between pb-1"
                                >
                                  <h2
                                    class="text-base font-semibold leading-6 text-gray-900"
                                    id="slide-over-title"
                                  >
                                    Request For Quotation
                                  </h2>
                                  <div class="flex items-center h-auto ml-3">
                                    <button
                                      @click="slideOverOpen=false"
                                      class="absolute top-0 right-0 z-30 flex items-center justify-center px-3 py-2 mt-4 mr-5 space-x-1 text-xs font-medium uppercase border rounded-md border-neutral-200 text-neutral-600 hover:bg-neutral-100"
                                    >
                                      <svg
                                        xmlns="http://www.w3.org/2000/svg"
                                        fill="none"
                                        viewBox="0 0 24 24"
                                        stroke-width="1.5"
                                        stroke="currentColor"
                                        class="w-4 h-4"
                                      >
                                        <path
                                          stroke-linecap="round"
                                          stroke-linejoin="round"
                                          d="M6 18L18 6M6 6l12 12"
                                        ></path>
                                      </svg>
                                      <span>Close</span>
                                    </button>
                                  </div>
                                </div>
                              </div>
                              <div class="relative flex-1 px-4 mt-5 sm:px-5">
                                <div class="absolute inset-0 px-4 sm:px-5">
                                  <div
                                    class="relative h-full overflow-hidden border border-dashed rounded-md border-neutral-300"
                                  >
                                    <!-- Replace the fragment with this inner html -->
                                    <div
                                      class="bg-white shadow-md rounded-md p-4"
                                      hx-trigger="show"
                                      hx-post="/service/rfq?RequestForQuotation='${rfq.getRFQ()}'"
                                    >
                                      <div class="flex justify-between mb-2">
                                        <h2 class="text-lg font-semibold">
                                          ${rfq.getRFQ()}
                                        </h2>
                                        <button
                                          class="text-gray-600 hover:text-gray-900 transition duration-200"
                                        >
                                          <svg
                                            xmlns="http://www.w3.org/2000/svg"
                                            class="h-5 w-5"
                                            viewBox="0 0 20 20"
                                            fill="currentColor"
                                          >
                                            <path
                                              d="M10 6a2 2 0 110-4 2 2 0 010 4zM10 12a2 2 0 110-4 2 2 0 010 4zM10 18a2 2 0 110-4 2 2 0 010 4z"
                                            />
                                          </svg>
                                        </button>
                                      </div>
                                      <h3 class="text-base font-medium mb-1">
                                        Description:
                                      </h3>
                                      <p class="text-gray-600 text-sm mb-4">
                                        ${rfq.getRFQDescription()}
                                      </p>
                                      <div
                                        class="flex flex-wrap justify-between mb-4"
                                      >
                                        <div
                                          class="w-full md:w-1/2 xl:w-1/3 p-2"
                                        >
                                          <h4
                                            class="text-base font-medium mb-1"
                                          >
                                            RFQ Status:
                                          </h4>
                                          <p class="text-gray-600 text-sm">
                                            ${rfq.getStatus()}
                                          </p>
                                        </div>
                                        <div
                                          class="w-full md:w-1/2 xl:w-1/3 p-2"
                                        >
                                          <h4
                                            class="text-base font-medium mb-1"
                                          >
                                            Created Date:
                                          </h4>
                                          <p class="text-gray-600 text-sm">
                                          @if(rfq.getQuotationStartDate() != null) 
                                            ${rfq.getQuotationStartDate().format(DateTimeFormatter.ofPattern("dd/MM/yyyy"))}
                                          @endif
                                          </p>
                                        </div>
                                        <div
                                          class="w-full md:w-1/2 xl:w-1/3 p-2"
                                        >
                                          <h4
                                            class="text-base font-medium mb-1"
                                          >
                                            Deadline:
                                          </h4>
                                          <p class="text-gray-600 text-sm">
                                            ${rfq.getQuotationDeadline().format(DateTimeFormatter.ofPattern("dd/MM/yyyy"))}
                                          </p>
                                        </div>
                                      </div>
                                      <div class="flex justify-between">
                                        <button
                                          class="bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded"
                                        >
                                          View Details
                                        </button>
                                        <button
                                          class="bg-orange-500 hover:bg-orange-700 text-white font-bold py-2 px-4 rounded"
                                        >
                                          Edit RFQ
                                        </button>
                                      </div>
                                    </div>
                                  </div>
                                </div>
                              </div>
                            </div>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                </template>
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

    <script
      src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
      integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
      crossorigin="anonymous"></script>
    <script
      src="https://unpkg.com/htmx.org@2.0.4"
      integrity="sha384-HGfztofotfshcF7+8n44JQL2oJmowVChPTg48S+jvZoztPfvwD79OC/LTtG6dMp+"
      crossorigin="anonymous"></script>
    <script src="https://unpkg.com/alpinejs" defer></script>
    <script src="https://cdn.tailwindcss.com"></script>
  </body>
</html>

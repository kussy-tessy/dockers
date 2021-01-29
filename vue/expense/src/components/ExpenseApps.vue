<template>
  <div>
    <table style="margin: auto">
      <thead>
        <td>日付</td>
        <td>種別</td>
        <td>摘要</td>
        <td>片道/往復</td>
        <td>金額</td>
        <td></td>
      </thead>
      <tbody>
        <tr v-for="(expense, i) in expenses" v-bind:key="i">
          <td><input type="date" v-model="expense.date" /></td>
          <td>
            <select v-model="expense.type">
              <option value="交通費">交通費</option>
              <option value="宿泊費">宿泊費</option>
              <option value="その他">その他</option>
            </select>
          </td>
          <td><input type="text" v-model="expense.remarks" /></td>
          <td>
            <select
              v-model="expense.ticket_type"
              :disabled="expense.type != '交通費'"
            >
              <option value="片道">片道</option>
              <option value="往復">往復</option>
            </select>
          </td>
          <td>
            <input
              type="text"
              v-model="expense.expense"
              @change="calcSumExpense"
            />
          </td>
          <td>
            <DynamicTableButton
              :i="i"
              :data="expenses"
              :temp="expense_template"
              @change="calcSumExpense"
            ></DynamicTableButton>
          </td>
        </tr>
        <tr>
          <td colspan="7" style="text-align: right">
            合計:
            {{ sumExpense }}円
          </td>
        </tr>
      </tbody>
    </table>
  </div>
</template>

<script>
import DynamicTableButton from "./DynamicTableButton";

export default {
  components: {
    DynamicTableButton,
  },
  name: "ExpenseApps",
  data: function () {
    return {
      expenses: [],
      expense_template: {
        date: "",
        type: "交通費",
        remarks: "",
        ticket_type: "片道",
        expense: "",
      },
      sumExpense: 0,
    };
  },
  created: function () {
    this.expenses.push({ ...this.expense_template });
  },
  methods: {
    calcSumExpense: function () {
      this.sumExpense = this.expenses
        .map((r) => parseInt(r.expense))
        .filter((n) => n)
        .reduce((a, b) => a + b, 0);
    },
  },
};
</script>